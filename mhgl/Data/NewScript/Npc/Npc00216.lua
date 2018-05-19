Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Npc000216= {	
	npc_id = 216,				
	name = GetNpcName(216),							
}

function Npc000216:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
    NpcAsk({"龙宫里有数不尽的宝贝,有机缘之人才能得到。听巡逻虾兵说附近来了条小龙,不过好像鬼鬼祟祟的,莫非有什么企图不成？",
          "龙王正在广招门徒,这几天拜师的人越来越多了。",
          "咱龙王老爷就在我身后的大殿里,不过可不是什么人都能进去的！"})
		if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
			(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
			(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
			(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
			SetAnswer(1, "任务链")
		end
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			if HasQuest(26001) then
				Quest26001:Return()
			elseif HasQuest(26002) then
				Quest26002:Return()
			elseif HasQuest(26003) then
				Quest26003:Return()
			elseif HasQuest(26004) then
				Quest26004:Return()
			end
		end
	else
    NpcAsk({"龙宫里有数不尽的宝贝,有机缘之人才能得到。听巡逻虾兵说附近来了条小龙,不过好像鬼鬼祟祟的,莫非有什么企图不成？",
          "龙王正在广招门徒,这几天拜师的人越来越多了。",
          "咱龙王老爷就在我身后的大殿里,不过可不是什么人都能进去的！"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
	end
end

AddNpcTable(Npc000216)