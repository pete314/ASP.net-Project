-- Author: Peter Nagy
-- Stored procedure for generating password reset tokens
Create proc spResetPassword
@UserEmail nvarchar(100)
as
Begin
 Declare @UserId int
 Declare @Email nvarchar(100)
 Declare @UserName nvarchar(100)
 
 Select @UserId = id, @Email = email, @UserName = name
 from users
 where email = @UserEmail
 
 if(@UserId IS NOT NULL)
 Begin
  Declare @GUID UniqueIdentifier
  Set @GUID = NEWID()
  
  Insert into password_reset_token
  (id, user_id, created)
  Values(@GUID, @UserId, GETDATE())
  
  Select 1 as ReturnCode, @GUID as Token, @Email as Email, @UserName as Name
 End
 Else
 Begin
  SELECT 0 as ReturnCode, NULL as Token, NULL as Email, NULL as Name
 End
End