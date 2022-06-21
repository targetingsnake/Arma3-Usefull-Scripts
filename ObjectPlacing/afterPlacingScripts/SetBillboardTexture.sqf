if (!isServer) exitWith{};

systemChat "Test";

_object = _this select 0;
_texture = _this select 1;

_object setObjectTextureGlobal _texture;