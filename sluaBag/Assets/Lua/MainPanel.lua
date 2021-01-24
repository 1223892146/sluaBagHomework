
--只要是一个新的对象(面板)我们就新建一张表
BasePanel:subClass("MainPanel")

--需要做 实例化面板对象
--为这个面板处理对象的逻辑 比如按钮点击等等


--初始化该面板 实例化对象 控件事件监听
function MainPanel:Init(name)
    if self.base == nil then
        print(MainPanel)
    end
    self.base.Init(self,name)
    if self.isInitEvent == false then
    self:GetControl("btnBag","Button").onClick:AddListener(
        function() 
            self:BtnRoleClick()
        end
    )
    self.isInitEvent = true;
    end
    print("结束")
end


function MainPanel:BtnRoleClick()
    BagPanel:ShowMe("BagPanel")
    --等我们写了背包面板
    --在这里显示我们的背包面板
end