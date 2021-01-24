
--利用面向对象
Object:subClass("BasePanel")

BasePanel.panelObj = nil

--相当于一个字典 键为 控件名 值为 控件本身
BasePanel.controls = {}
BasePanel.isInitEvent = false

function BasePanel:Init(name)
    if self.panelObj == nil then
        --公共的实例化方法
        self.panelObj = ABMgr:LoadRes("ui",name,GameObject)
        self.panelObj.transform:SetParent(canvas,false)
        --GetComponentsInChildren 
        --找到所有UI控件
        local allControls = self.panelObj:GetComponentsInChildren(UIBehaviour) --返回的是C#中的数组
        --为了避免找到各种无用的空间 我们定一个规则 空间命名按一定规范来
        --Button btn
        --Toggle tog
        --Image img
        --ScrollRect sv
        
      --  if allControls ~= nil then
       --     print(allControls)
       -- end
       
     --  for i,v in pairs(allControls) do
      --  print("arr item",i,v)
      --  end

      -- print("all"..#allControls[1])
        for i = 1, allControls.Length do
            
            --local all = allControls[0]
            
            --print("kk"..allControls)
            local controlName = allControls[i].name
            --按照名字的规则 去找控件 必须满足命名规则 才存起来
            if string.find(controlName,"btn")~= nil  or
            string.find(controlName,"tog")~= nil or
            string.find(controlName,"img")~= nil or
            string.find(controlName,"sv")~= nil or
            string.find(controlName,"txt") ~= nil then

                local typeName = allControls[i]:GetType().Name
                --为了避免一个对象挂多个控件出现覆盖的问题

                --最终的存储形式
                --{btnRole = {Image = 控件,Button = 控件}}
                if self.controls[controlName] ~= nil then
                    self.controls[controlName][typeName] = allControls[i]
                else
                    --为了让我们得到控件类型，所以需要存储
                    self.controls[allControls[i].name] = {[typeName] = allControls[i]}
                end
            end
            -- body
        end
    end
end

--得到控件
function BasePanel:GetControl(name,typeName)
    if self.controls[name] ~= nil then
        local sameNameControls = self.controls[name]
        if sameNameControls[typeName] ~= nil then
            return sameNameControls[typeName]
        end
    end

end

function BasePanel:ShowMe(name)
    self:Init(name)
    self.panelObj:SetActive(true)
end

function BasePanel:HideMe()
    self.panelObj:SetActive(false)
end