# MGCheckStrongPassword
Control the strength of your password

As part of a personal project, I developed a connection management module.
In this connection module I let the users choose their own password.
So it is necessary to control that their password is a minimum secure, to do this I created a Class with a function that controls some parameters.

#1 : The length of the password which is adjustable.
#2 : The presence of at least one capital letter.
#3 : The presence of at least one lower case letter.
#4 : The presence of at least one number.
#5 : The presence of at least one special character.

To feed this function you have to give it 3 parameters: 
#1 : The minimum length of the password (Int)
#2 : The field to check (UITextField)
#3 : The password strength indicator (UIProgressView)

The indicator increases and changes its hue according to the complexity of the password.

func MGSetStrongPwd(getCount: Int, getTextField: UITextField, getProgress: UIProgressView)
