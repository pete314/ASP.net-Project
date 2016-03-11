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

-- Check if password token is valid
-- Return user id if is valid
Create Proc spTokenLookup 
@TOKEN uniqueidentifier
as
Begin
 Declare @UserId int
 
 If(Exists(Select @UserId = user_id from password_reset_token where id = @TOKEN))
 Begin
  Select 1 as IsValidToken, @UserId as USER
 End
 Else
 Begin
  Select 0 as IsValidToken, @UserId as USER
 End
End

-- Change user password
Create Proc spChangeUserPassword
@Password nvarchar(100),
@UserId int,
@GUID uniqueidentifier
as
Begin
 if(@UserId is null)
 Begin
  Select 0 as IsPasswordChanged
 End
 Else
 Begin
  Update tblUsers set
  [password] = @Password
  where id = @UserId
  
  -- delete token
  Delete from password_reset_token
  where Id = @GUID
  
  Select 1 as IsPasswordChanged
 End
End
