--wangzl
--元旦组队任务
Quest304100 = {
	quest_id = 304100,							-- 任务 ID
	type_id = 9233,								-- 大类 ID
	type_name = "鬼王任务",							-- 任务名称
	name = "消灭鬼王",							-- 任务名称
	feature = {"cancel", "failOverTime","failPlayerDie" ,"failEscape" },		-- 任务特性
	round_info = {max_round = 10, limit_round = 50, limit_type = 1},
	time_limit = 1800,
	require = {minLv = 3000},
	--tips = ""
}
 
function Quest304100:Take()
	if party == nil then
		NpcSay("必须\#G1\#W人以上队伍才能领取任务。")
		return false
	elseif party:GetCount() < 1 then
		NpcSayParty("队伍人数少于\#G1\#W人，无法领取任务。")
		return false
	end
	local maxLevel=0
	local minLevel=1000
	for i = 0, party:GetCount() - 1 do
		local member = party:GetMember(i)
		if member then
			if member:GetLevel()>maxLevel then
				maxLevel=member:GetLevel()
			end
			if member:GetLevel()<minLevel then
				minLevel=member:GetLevel()
			end
		    if member:GetLevel() < 120 then
				NpcSayParty(string.format("玩家\#P%s\#W等级不足120级，无法领取任务。", member:GetName()))
				return
			elseif member:GetQuests():HasQuest(self.quest_id) then
				NpcSayParty(string.format("队伍中的玩家\#P%s\#W身上已有任务，无法再次接获。", member:GetName()))
				return
			elseif member:GetQuests():GetType(9233) and member:GetQuests():GetType(9233):GetTotalRound() >= 100 then
				NpcSayParty(string.format("\#P%s\#W任务次数已达\#G300\#W次，请明日再来吧。",member:GetName()))
				return
			end
		end
	end
	if maxLevel-minLevel > 19 then
		NpcSay("队员之间等级不能超过\#G20\#W级。")
		return
	end
	if not IsProcess() then
		return true
	end
		local AvgLv = party:GetAvgLevel()
		local range
		range = {1,6,7,10,14,15,26,27,28,29,19,108,20,21,16,17,18,2} 
		local map_id = RandTable(range)
		local map = GetMap(map_id)
		local oneMap = {{map_id = map_id, x1 = 10, y1 = 10, x2 = map:GetWidth()-10, y2 = map:GetHeight()-10}}				
		local npclist = {}
	
	
		local moblist = {1170,1171,1172,1173,1174}
		
		if party:GetAvgLevel() < 180 then
			
	
			npclist = {401400,401401,401402,401403,401404}
		else
		
			npclist = {401400,401401,401402,401403,401404}
		end
		
		local R = math.random(1,5)
		local npc_id = npclist[R]
		local mob_id = moblist[R]
		
	    local loc = RandMapLoc(oneMap)
		if loc then
		-- 生成一个新 NPC 在该随机位置上
		script:SetSaying(true)
		script:GenerateNPC(npc_id, loc.map_id, loc.x, loc.y, false, 1800)
		local mapName = GetMapName(loc.map_id)
		local npcName = GetNpcName(npc_id)
		NpcSayParty(string.format("最近鬼王闹的很，你赶紧去把他们抓回来。",mapName))
		self.descript = string.format("鬼王在\#P%s\#W一带逃窜，快去将他缉拿归案~！。",mapName)
		self.target_npc = {{ npc_id = npc_id, map_id = loc.map_id, x = loc.x, y = loc.y }}
		self.target_mob = {{ mob_id = mob_id, count = 1 }}			
		AddQuestParty(self)
	end
end

function Quest304100:Return(actor,pater)
	if actor == nil then return false end	

	local qtype = actor:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end 
	if not actor:GetQuests():HasQuest(304100) then return end	
	local q = actor:GetQuests():GetQuest(self.quest_id)
	local npc_id = npc:GetNpc_id()
	local map_id = npc:GetMap_id()
	local x = npc:GetCurPosX()
	local y = npc:GetCurPosY()
	if not (q and q:GetTargetNpcId(1) == npc_id and q:GetTargetNpcMap(1) == map_id and q:GetTargetNpcX(1) == x and q:GetTargetNpcY(1) == y) then
		return false
	end
	if not IsProcess() then return true end	
	local round = qtype:GetRound()		
	local LvPlayer = actor:GetLevel()	
	if party then
		AvgLevel = party:GetAvgLevel()
	else
		AvgLevel = player:GetLevel()
	end
	--角色等级差修正系数
	local lvdiffModify = 0
	local lvdiff = LvPlayer-AvgLevel
	if lvdiff <= -41 then
		lvdiffModify = 0.6				
	elseif lvdiff <= -31 then
		lvdiffModify = 0.7				
	elseif lvdiff <= -21 then
		lvdiffModify = 0.8				
	elseif lvdiff <= -11 then
		lvdiffModify = 0.9	
	elseif lvdiff <= 10 then
		lvdiffModify = 1
	elseif lvdiff <= 20 then
		lvdiffModify = 0.9
	elseif lvdiff <= 30 then
		lvdiffModify = 0.8
	elseif lvdiff <= 40 then
		lvdiffModify = 0.7
	else
		lvdiffModify = 0.6
	end	
	--召唤兽等级差修正系数					
	local pLvPlayer = 0		
	local partner = actor:GetCurPartner()
	if partner then
		pLvPlayer =partner:GetLevel()
	end			 
	local plvdiffModify = 0
	local plvdiff = math.abs(pLvPlayer-AvgLevel)
	if plvdiff <= 4 then
		plvdiffModify = 1
	elseif plvdiff <= 6 then
		plvdiffModify = 0.9
	elseif plvdiff <= 8 then
		plvdiffModify = 0.75
	elseif plvdiff <= 10 then
		plvdiffModify = 0.55
	elseif plvdiff <= 12 then
		plvdiffModify = 0.30
	elseif plvdiff <= 30 then
		plvdiffModify = 0.3 - plvdiff/100
	else
		plvdiffModify = 0	
	end			
	local flag80086 = actor:GetQuests():GetFlag(80086) ---幻境积分
	local flag = math.random(1,2)
	if actor:HasBuff(218) then --每轮战斗获得的幻境积分
		flag = flag * 2
	end
	
	local Exp = 50000000
	local ExpPartner = (10 * AvgLevel + 10) * 6.6 * 70 * 3 * 2 * (0.01+0.18*round) * plvdiffModify * 0.5/15
	local SMoney = 1000000												
	actor:ChangeExp(Exp,2)	
	actor:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d", Exp))
	actor:ChangeMoney(1000000)	
	actor:GetScript():ShowError(string.format("\#W获得银子%d", SMoney))
	actor:GetQuests():SetFlag(80086,flag80086+flag)
	actor:GetScript():ShowError(string.format("\#W获得幻境积分%d", flag))
	if pater and partner:GetLevel()-actor:GetLevel() < 5 and ExpPartner > 1 then
		actor:GetCurPartner():ChangeExp(ExpPartner,2)
		actor:GetScript():ShowError(string.format("\#W召唤兽获得经验值%d", ExpPartner))  
	end	
	local number = math.random(1,100)
	if number <= 10 then
		self:GetTwo(actor)
	end
	actor:GetQuests():RemoveQuest(304100)
	if round >= qtype:GetMaxRound() then
		qtype:SetRound(0)
	end
end




function Quest304100:GetTwo(actor)
	if not IsProcess() then return true end	
	if actor:GetItems():GetFreeSlot(0) <=0 then return end
	local rand = math.random(1,100)



	local item_id = 0
	if rand <= 10 then
	  item_id = RandTable({80170,80171,80170})--五宝
	
	
	elseif rand <= 20 then
		item_id = 20001    --藏宝图	

	elseif rand <= 25 then     --1-2级宝石
		item_id = RandTable({15006,15007,15008,15009})

	elseif rand <= 0 then
		item_id = 61226	      -- 国庆大礼包
	
	elseif rand <= 0 then
		item_id = 60126     --	中国结
	
	elseif rand <= 0 then
		item_id = 20001     --  高级藏宝图	

	elseif rand <= 0 then
		item_id = 60136     --十步一杀
	
	elseif rand <= 0 then
		item_id = 60231		-- 精铁礼盒
	
	elseif rand <= 0 then
		item_id = 60230     --蓝绿红黄旗子
	
	elseif rand <= 0 then
		item_id = 30000   --金柳露

	end
	if item_id ~= 0 then
		actor:GetItems():AddItem(item_id,1)	
		actor:GetScript():ShowError(string.format("\#W获得%s",GetItemName(item_id)))
		script:Rumor(string.format("\#W%s\#O在抓捕鬼王的战斗中，意外的获得了一个\#B%s\。", actor:GetName(), GetItemName(item_id)), false)								
	end		
end


AddQuestTable(Quest304100)
