
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00372 = {							-- 孙小红
	npc_id = 372,						-- NPC ID
	name = GetNpcName(372),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00372:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 10) then
    NpcAsk("客观今天需要来点什么？~！")
    SetAnswer(1,"购买")
    SetAnswer(2,"我什么都不想做")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if IsProcess() then
        script:OpenInterface("shop", 609);
      end
    end
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end


   



 
 
 
 
 
 
 
 
 
 
 
 
 --[[
        
  NpcSay({"",
          "",
          "",
          ""})
        end

--]]







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00372)
