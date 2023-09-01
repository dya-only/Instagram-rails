Ruby on Rails Backend Template

## UserController
 - GET  [/api/user]        : getAll
 - GET  [/api/user/:id]    : findById     (params: id)
 - POST [/api/user/avatar] : uploadAvatar (body: id, avatar)

## AuthController
 - POST [/api/auth/signup] : sign_up      (body: email, name, username, password, avatar)
 - POST [/api/auth/login]  : login        (body: email, password)
