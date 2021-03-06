-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest30300 = {
	quest_id = 30300,							-- 任务 ID
	type_id = 303,								-- 大类 ID
	type_name = "师门任务",
	round_info = {max_round = 10, limit_round = 60, limit_type = 1}, 
	name = "师傅好客",							-- 任务名称
	feature = { "cancel" },						-- 任务特性
	time_mark = 303,                          -- 时间标志  
}

-- Quest30300 拿取任务方法
function Quest30300:Take()
	if player:GetExp() >= 8 * player:GetNextLvExp() and player:GetLevel() < 50 then
		NpcSay("50级以下的角色，当前经验大于8倍的升级经验时，无法接取师门任务。")
		return false
	end
		
	if not CanAddRound(self.type_id) then
		NpcSay("好徒儿今天做的事情够多了，休息一下明天再来吧。")
		return false
	end

	if not IsProcess() then return true end
	script:SetSaying(true)
	local npcList = {}
	if player:GetLevel() < 20 then
		npcList = {
						{npc_id = 17, map_id = 1,  tip ="赵元宝在建邺城"},
						{npc_id = 17, map_id = 1,  tip ="赵元宝在建邺城"},
						{npc_id = 10, map_id = 1,  tip ="符全在建邺城"},
						{npc_id = 26, map_id = 1,  tip ="张来福在建邺"},
						{npc_id = 285, map_id = 34,  tip ="兰虎在长安擂台"},
						{npc_id = 278, map_id = 34,  tip ="王大嫂在长安"},
						{npc_id = 321, map_id = 34,  tip ="威震天在长安"},
						{npc_id = 310, map_id = 34,  tip ="小宝在长安"},
						}
	else
		npcList = {
						{npc_id = 17, map_id = 1,  tip ="赵元宝在建邺城"},
						{npc_id = 17, map_id = 1,  tip ="赵元宝在建邺城"},
						{npc_id = 10, map_id = 1,  tip ="符全在建邺城"},
						{npc_id = 26, map_id = 1,  tip ="张来福在建邺"},
						{npc_id = 285, map_id = 34,  tip ="兰虎在长安擂台"},
						{npc_id = 278, map_id = 34,  tip ="王大嫂在长安"},
						{npc_id = 321, map_id = 34,  tip ="威震天在长安"},
						{npc_id = 310, map_id = 34,  tip ="小宝在长安"},
						}
	end
	
	local r = RandTable(npcList)				-- 随机从 table 中取一个 object
	local npcName = GetNpcName(r.npc_id)		-- 取该 NPC 名字
	local mapName = GetMapName(r.map_id)		-- 取该地图名字
	local tips = r.tip
	
	-- NPC 与玩家说话
	NpcSay(string.format("为师很久没有和一些老朋友见面了，你这就去替为师请\#A%s\#W来府中做客吧。", npcName))
	-- 设定任务内容
	self.descript = string.format("替师傅去邀请\#A%s\#W到府中做客。##%s",npcName,tips)
	-- 设定任务完成的 NPC
	self.end_npc = { npc_id = npc:GetNpc_id(), map_id = npc:GetMap_id() }
	-- 设定任务要求的 NPC
	self.target_npc = { r }
	-- 将任务表加入玩家身上
	AddQuest(self)
	return true
end

-- Quest30300 交回任务方法
function Quest30300:Return()
	if not QuestCompleted(self) then 
		NpcSay("好徒儿，快去快回吧。")
	    return false 
	end

	-- 在脚本处理阶段及任务已经完成？
	if IsProcess() then
		script:SetSaying(true)
		local qtype = player:GetQuests():GetType(self.type_id)
		if qtype == nil then return false end
		local totalRound = qtype:GetTotalRound()
		local round = qtype:GetRound()
		local quest = player:GetQuests():GetQuest(self.quest_id)
		local freeSlot = player:GetItems():GetFreeSlot(0)
		local rexp = math.random(9500,10500)/10000
		local lv = player:GetLevel()
		local exp = 0
		local money = 0
		local doubleRound = 1
		local expup = 3
		local item = 0
		local id = player:GetChar_id()
		local Gold = math.random(50,80) --元宝
		if totalRound < 21 then
			doubleRound = 2
			expup = 8
		end
		--标准经验
		local EPH =(4 * lv + 10) * 6.6 * 70
		--经验系数
		local coExp = 1
		--基准经验
		local  baseExp = EPH * coExp
		--经验时间系数
		local timecoExp = 4
		--每轮师门获得的经验奖励
		local EPR = baseExp / timecoExp 
		--每轮师门获得的金钱奖励
		    local GPR = 0 
	        if lv >= 10 and lv <= 19 then
			    GPR = 50 * lv + 2500
			elseif lv >= 20 and lv <= 29 then
			    GPR = 50 * lv + 10000
			elseif lv >= 30 and lv <= 49 then
			    GPR = 100 * lv + 14000
			elseif lv >= 50 and lv <= 69 then
			    GPR = 150 * lv + 21000
			elseif lv >= 70 and lv <= 89 then
			    GPR = 200 * lv + 32000
		  elseif lv >= 90 and lv < 119 then
		      GPR = 200 * lv + 50000
		  elseif lv >= 119 and lv < 159 then
		      GPR = 200 * lv + 62000
		    end
		
		exp = math.floor(EPR * (15+1.8*round) /25 * rexp * doubleRound ) * 2  * round / 2 * expup
		money = math.floor(GPR * (5+1.5*round) / 40 * rexp * doubleRound )	
        
        
		if math.random(1,10) == 1 and totalRound == 20 then
			exp = 5 * exp
			script:Rumor(string.format("\#W%s\#O在完成第20次师门任务时，师傅特奖励给他5倍的经验，以资鼓励。", player:GetName()), false)
		end
		
		if player:HasBuff(218) and totalRound > 20 then
		    exp = 2 * exp
		end
		if player:HasBuff(219) and totalRound > 20 then
			exp = 3 * exp
		end		
		
		local msgDonate = ""
		local donate = 0
		if round == 6 or round == 7 then	
			donate = 1
		elseif round == 8 or round == 9 then	
			donate = 2
		elseif round == 10 then	
			donate = 3
		end
		if donate ~= 0 then				
			msgDonate = string.format("奖励你门派贡献\#P%d\#W点。", donate)
		end
		
		local msgHonor = ""
		local Honor = 0
		local GainHonor = 0
		if lv < 30 then
			Honor = 300
		elseif lv < 50 then
		    Honor = 600
		elseif lv < 70 then
			Honor = 1000
		elseif lv < 90 then
			Honor = 1400
		elseif lv > 189 then
		    Honor = 2000
		end	
		if round == 10 and totalRound <= 20  then	
			GainHonor = Honor	
			msgHonor = string.format("奖励你\#P%d\#W威望。",GainHonor)				
		end
		
		local Gtype = player:GetQuests():GetType(3030)
		if Gtype == nil then
			player:GetQuests():SetRoundInfo(3030, 50, 50, 2)
			Gtype = player:GetQuests():GetType(3030)
		end
		if Gtype:GetLimitType() == 7 then
			player:GetQuests():SetRoundInfo(3030, 50, 50, 2)
		end
		local GtotalRound = Gtype:GetTotalRound()
		local msgVP = ""
		local GainVP = 0
		if totalRound == 20 then
			GainVP = 5 * lv + 10
			msgVP = string.format("奖励你\#P%d\#W体力。",GainVP)
		end		
		
		if Gtype:GetTotalRound() == 4 and totalRound == 20 and player:GetItems():GetFreeSlot(0) < 2 then
			NpcSay(string.format("请整理你的当前包裹，至少预留2个位置。"))
			return 
		else		
			player:ChangeSMoney(20000)
			--player:ChangeMoney(20000)
			ShowError("\#W获得储备金20000两")
			player:ChangeExp(exp,303)
			player:ChangeMoney(money,303)
			player:ChangeFDonate(donate)
			player:SetHonor(player:GetHonor() + GainHonor)
			player:ChangeVP(GainVP)
			NpcSay(string.format("做的很好，奖励你\#P%d\#W点经验和\#P%d\#W银两。%s%s%s",exp,money,msgDonate,msgHonor,msgVP))
			ShowError(string.format("\#W获得经验值%d，银两%d",exp,money))
			if donate ~= 0 then
				ShowError(string.format("\#W获得门派贡献%d",donate))
			end
			if GainHonor ~= 0 then
				ShowError(string.format("\#W获得威望%d",GainHonor))
			end
			if GainVP ~= 0 then
				ShowError(string.format("\#W获得体力%d",GainVP))
				Gtype:ChangeTotalRound(1)
				if Gtype:GetTotalRound() == 1 then
					NpcSay("本周内完成每日前20次师门：1次。本周内完成5次会有意外惊喜奖励！")
				elseif Gtype:GetTotalRound() == 2 then
					NpcSay("本周内完成每日前20次师门：2次。本周内完成5次会有意外惊喜奖励！")
				elseif Gtype:GetTotalRound() == 3 then
					NpcSay("本周内完成每日前20次师门：3次。本周内完成5次会有意外惊喜奖励！")
				elseif Gtype:GetTotalRound() == 4 then
					NpcSay("本周内完成每日前20次师门：4次。本周内完成5次会有意外惊喜奖励！")
				elseif Gtype:GetTotalRound() == 5 then
					NpcSay("本周内完成每日前20次师门：5次。意外获得惊喜奖励！")
					player:GetItems():AddItem(402832, 1)
					ShowError(string.format("\#W获得5000元宝票"))
					item = RandTable({400000,400001,400002,400003,400004,400005,400006,400007,400008,400009,400010,400011,400012,400013,400014,400015,400016,400017,400018,400019,400020,400021,400022,400023,400024,400025,400026,400027,400028,400029,400030,400031,400032,400033,400034,400035,400036,400037,400038,400039,400040,400041}) --变身卡
					player:GetItems():AddItem(item, 1)
					ShowError("\#W获得一张怪物卡片")
					local file = io.open("./LuaDat/PayConfig.dat",'a')
					file:write(string.format("%s %d\r\n",id,Gold))
					file:close()
					ShowError(string.format("\#W获得元宝#P%d#W点，商城刷新获得",Gold))
				end
			end
			RemoveQuest(self)
			player:GetQuests():RemoveTimeMark(303)		    
		end	
		if round >= qtype:GetMaxRound() then
			qtype:SetRound(0)
		end
	end
	return true
end

-- 必需在脚本最后将任务表加入系统中
AddQuestTable(Quest30300)
