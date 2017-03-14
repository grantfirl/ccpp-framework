module thompsonaero

    use, intrinsic :: iso_c_binding

    use            :: types,                                            &
                       only: aip_t
    implicit none

    private
    public :: thompsonaero_cap

    contains

    subroutine thompsonaero_cap(ptr) bind(c)
        implicit none
        type(c_ptr), intent(inout) :: ptr

        type(aip_t), pointer :: ap_data

        call c_f_pointer(ptr, ap_data)

        print *, 'THOMPSONAERO  Cap: scheme name ',                                         &
                 trim(ap_data%schemes(ap_data%physics_call, ap_data%ipd_call)),&
                 ' #',ap_data%physics_call,' of ',                              &
                 ap_data%n_schemes(ap_data%ipd_call),                       &
                 ' schemes scheduled for IPD call # ',                         &
                 ap_data%ipd_call,                                             &
                 ' (of total ',                                                &
                 ap_data%n_ipd_calls,                                          &
                 ' IPD calls)'

    end subroutine thompsonaero_cap

end module thompsonaero
