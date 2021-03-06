program main

!*****************************************************************************80
!
!! MAIN is the main program for CONSTANT_TYPE.
!
!  Discussion:
!
!    CONSTANT_TYPE demonstrates that constants may need to be given a type.
!
!    It is natural to assume that if you go to the trouble of typing
!    14 decimals in a constant, that FORTRAN will somehow use them.
!    But constants have a type, just like variables.  If you don't
!    somehow specify a type, then a constant will be treated like
!    a single precision value (assuming you used a decimal point
!    somewhere.)
!
!    This means that, for instance, if you print out the value of
!    ( 1.0203040506070809 - 1.020304050607 ), it will almost certainly
!    be 0.
!
!  Licensing:
!
!    This code is distributed under the GNU LGPL license.
!
!  Modified:
!
!    19 February 2008
!
!  Author:
!
!    John Burkardt
!
  implicit none

  real ( kind = 4 ) a
  real ( kind = 8 ) b
  real ( kind = 16 ) c

  call timestamp ( )

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) 'CONSTANT_TYPE'
  write ( *, '(a)' ) '  FORTRAN90 version.'
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  Demonstrate that constants have a type.'

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  EXAMPLE 1:'
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  Print the value of'
  write ( *, '(a)' ) '    1.0203040506070809 - 1.020304050607'
  write ( *, '(a)' ) ' '
  write ( *, * ) '    1.0203040506070809 - 1.020304050607 = ', &
    1.0203040506070809 - 1.020304050607
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  If single precision is the default, this will be 0.'

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  EXAMPLE 2:'
  write ( *, '(a)' ) '  A constant has a type.'
  write ( *, '(a)' ) '  If you do not specify one, one will be provided.'
  write ( *, '(a)' ) '  Here, we assign a 32 decimal constant to single,'
  write ( *, '(a)' ) '  double, and quadruple precision variables.'
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  Because we do not "type" the constant, we really'
  write ( *, '(a)' ) '  only get the benefit of the first 8 or so decimals.'
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '    a = 1.020304050607080910111213141516'
  write ( *, '(a)' ) '    b = 1.020304050607080910111213141516'
  write ( *, '(a)' ) '    c = 1.020304050607080910111213141516'

  a = 1.020304050607080910111213141516
  b = 1.020304050607080910111213141516
  c = 1.020304050607080910111213141516

  write ( *, '(a)' ) ' '
  write ( *, * ) '  A = ', a
  write ( *, * ) '  B = ', b
  write ( *, * ) '  C = ', c

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  EXAMPLE 3:'
  write ( *, '(a)' ) '  Use an exponent marker of "E", "D" or "Q" to indicate'
  write ( *, '(a)' ) '  that your constant is single, double or quadruple'
  write ( *, '(a)' ) '  precision.'
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  If the compiler does not like our specification,'
  write ( *, '(a)' ) '  the constant is treated as single precision, and'
  write ( *, '(a)' ) '  some of the information in the constant is discarded,'
  write ( *, '(a)' ) '  with NO WARNING.'
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '    a = 1.020304050607080910111213141516E+00'
  write ( *, '(a)' ) '    b = 1.020304050607080910111213141516D+00'
  write ( *, '(a)' ) '    c = 1.020304050607080910111213141516Q+00'

  a = 1.020304050607080910111213141516E+00
  b = 1.020304050607080910111213141516D+00
  c = 1.020304050607080910111213141516Q+00

  write ( *, '(a)' ) ' '
  write ( *, * ) '  A = ', a
  write ( *, * ) '  B = ', b
  write ( *, * ) '  C = ', c

  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  EXAMPLE 4:'
  write ( *, '(a)' ) '  Use an kind marker of "_4", "_8" or "_16" to indicate'
  write ( *, '(a)' ) '  that your constant is single, double or quadruple'
  write ( *, '(a)' ) '  precision.  Might work, might not.'
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '    a = 1.020304050607080910111213141516_4'
  write ( *, '(a)' ) '    b = 1.020304050607080910111213141516_8'
  write ( *, '(a)' ) '    c = 1.020304050607080910111213141516_16'

  a = 1.020304050607080910111213141516_4
  b = 1.020304050607080910111213141516_8
  c = 1.020304050607080910111213141516_16

  write ( *, '(a)' ) ' '
  write ( *, * ) '  A = ', a
  write ( *, * ) '  B = ', b
  write ( *, * ) '  C = ', c
!
!  Terminate.
!
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) 'CONSTANT_TYPE'
  write ( *, '(a)' ) '  Normal end of execution.'

  write ( *, '(a)' ) ' '
  call timestamp ( )

  stop
end
subroutine timestamp ( )

!*****************************************************************************80
!
!! TIMESTAMP prints the current YMDHMS date as a time stamp.
!
!  Example:
!
!    31 May 2001   9:45:54.872 AM
!
!  Licensing:
!
!    This code is distributed under the GNU LGPL license.
!
!  Modified:
!
!    06 August 2005
!
!  Author:
!
!    John Burkardt
!
!  Parameters:
!
!    None
!
  implicit none

  character ( len = 8  ) ampm
  integer   ( kind = 4 ) d
  integer   ( kind = 4 ) h
  integer   ( kind = 4 ) m
  integer   ( kind = 4 ) mm
  character ( len = 9  ), parameter, dimension(12) :: month = (/ &
    'January  ', 'February ', 'March    ', 'April    ', &
    'May      ', 'June     ', 'July     ', 'August   ', &
    'September', 'October  ', 'November ', 'December ' /)
  integer   ( kind = 4 ) n
  integer   ( kind = 4 ) s
  integer   ( kind = 4 ) values(8)
  integer   ( kind = 4 ) y

  call date_and_time ( values = values )

  y = values(1)
  m = values(2)
  d = values(3)
  h = values(5)
  n = values(6)
  s = values(7)
  mm = values(8)

  if ( h < 12 ) then
    ampm = 'AM'
  else if ( h == 12 ) then
    if ( n == 0 .and. s == 0 ) then
      ampm = 'Noon'
    else
      ampm = 'PM'
    end if
  else
    h = h - 12
    if ( h < 12 ) then
      ampm = 'PM'
    else if ( h == 12 ) then
      if ( n == 0 .and. s == 0 ) then
        ampm = 'Midnight'
      else
        ampm = 'AM'
      end if
    end if
  end if

  write ( *, '(i2,1x,a,1x,i4,2x,i2,a1,i2.2,a1,i2.2,a1,i3.3,1x,a)' ) &
    d, trim ( month(m) ), y, h, ':', n, ':', s, '.', mm, trim ( ampm )

  return
end
