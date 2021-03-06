--HULA
Quest10052 = {
	quest_id = 10052,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "玄奘的身世",
	descript = "玄奘法师中毒已深,看来必须要孟婆汤才行,此药只有地府\#B孟婆\#W才有,赶快去问问她吧~！",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A孟婆\#W”就可以自动寻路至\#A孟婆\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=198, map_id=20} },
	end_npc = {npc_id=198, map_id=20},
	feature = {"nocancel"},	
}

function Quest10052:Take()
	if not player:GetQuests():HasQuest(10052) then
		local pname = player:GetName()
		if IsProcess() then
			AddQuest(Quest10052)			
		end
		return true
	else
		return false
	end
end

function Quest10052:Return()
	local pname = player:GetName()
	if QuestCompleted(self) then
		  NpcSay("施主原来是用此药救人,这是九转还魂丹,赶快拿去救人吧~！")
		  ISay("九转还魂丹找到了,剩下还需要孟婆汤,此药地府孟婆有,赶紧出发去地府找孟婆把~！")
		if IsProcess() then
			player:GetQuests():RemoveQuest(10052)
		end
		return true	
	else
		ISay("得赶快去天宫问问\#A孟婆\#W。")
		return false
	end
end

AddQuestTable(Quest10052)
