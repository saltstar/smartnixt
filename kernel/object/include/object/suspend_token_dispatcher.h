
#pragma once

#include <zircon/rights.h>
#include <zircon/types.h>

#include <fbl/canary.h>
#include <object/dispatcher.h>

#include <sys/types.h>

class SuspendTokenDispatcher final :
    public SoloDispatcher<SuspendTokenDispatcher, ZX_DEFAULT_SUSPEND_TOKEN_RIGHTS> {
public:
    static zx_status_t Create(fbl::RefPtr<ThreadDispatcher> thread,
                              fbl::RefPtr<Dispatcher>* dispatcher,
                              zx_rights_t* rights);

    ~SuspendTokenDispatcher() final;
    zx_obj_type_t get_type() const final { return ZX_OBJ_TYPE_SUSPEND_TOKEN; }
    void on_zero_handles() final;

    zx_status_t Resume(ThreadDispatcher* thread);

private:
    explicit SuspendTokenDispatcher(fbl::RefPtr<ThreadDispatcher> thread);
    fbl::Canary<fbl::magic("SUTD")> canary_;

    // A lock annotation is unnecessary because the only time thread_ is used is in on_zero_handles
    // and the constructor, and the an object can only get zero handles once.
    fbl::RefPtr<ThreadDispatcher> thread_;
};