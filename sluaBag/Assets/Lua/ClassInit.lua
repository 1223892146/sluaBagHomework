LoadLuaMgr = LoadMgrToLua()
ABMgr = LoadLuaMgr:GetABMgr()
PoolMgr = LoadLuaMgr:GetPoolMgr()
MonoMgr = LoadLuaMgr:GetMonoMgr()
EventCenter = LoadLuaMgr:GetEventCenter()
--常用别名都在里面定位
--面向对象相关
require("Object")
--字符串拆分
require("SplitTools")
--Json解析
Json = require("JSonUtility")

--Unity相关
GameObject = UnityEngine.GameObject
Resources = UnityEngine.Resources
Transform = UnityEngine.Transform
RectTransform = UnityEngine.RectTransform
TextAsset = UnityEngine.TextAsset
--图集对象类
SpriteAtlas = UnityEngine.U2D.SpriteAtlas
Vector3 = UnityEngine.Vector3
Vector2 = UnityEngine.Vector2

--UI相关
UI = UnityEngine.UI
Image = UI.Image
Text = UI.Text
Button = UI.Button
Toggle = UI.Toggle
ScrollRect = UI.ScrollRect
UIBehaviour = UnityEngine.EventSystems.UIBehaviour

canvas = GameObject.Find("Canvas").transform