--wangzl
--打雪仗
Preload("Quest69001.lua")
Bat000730 = {
	
}

-- 战斗开始之前
function Bat000730:OnInit()
--[[	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)	--]]

	local base_lv = player:GetLevel() / 2
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
	battle:AddMob(386, 1, base_lv)
	battle:AddMob(387, 1, base_lv)
	battle:AddMob(388, 1, base_lv)	
	battle:AddMob(389, 1, base_lv)	
	battle:AddMob(390, 1, base_lv)	
	battle:AddMob(391, 1, base_lv)	
	battle:AddMob(392, 1, base_lv)	
	battle:AddMob(393, 1, base_lv)	
	battle:AddMob(394, 1, base_lv)	
end
	

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat000730:OnPreTurn(turn)
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat000730:OnPostTurn(turn)	
	
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat000730:OnFinish(turn,result)


	local LvMob = 10
	local LvPlayer = 0
	local lvdiffModify = 0
	local lvdiff = 0						
	local pLvPlayer = 0			 
	local plvdiffModify = 0
	local plvdiff = 0
	local Exp = 0
	local ExpPartner = 0	
	local Money = 0
	for i = 0, battle:GetCharacterCount() - 1 do
		local actor = battle:GetCharacter(i)
		local owner = actor:GetOwner()
		if owner then
			if result == LuaI.END_WIN and not actor:IsDead() then
				LvPlayer = owner:GetLevel()
				lvdiff = math.abs(LvPlayer-LvMob)
				if lvdiff <= 10 then
		            lvdiffModify = 1
		        elseif lvdiff <= 20 then
		            lvdiffModify = 0.9
		        elseif lvdiff <= 30 then
		            lvdiffModify = 0.8
				else
					lvdiffModify = 0.5
				end
		        if owner:GetCurPartner() then
		            pLvPlayer =owner:GetCurPartner():GetLevel()
		        end			 
				plvdiff = math.abs(pLvPlayer-LvMob)
				if plvdiff <= 10 then
		            plvdiffModify = 1
		        elseif plvdiff <= 20 then
		            plvdiffModify = 0.9
		        elseif plvdiff <= 30 then
		            plvdiffModify = 0.8
				else
					plvdiffModify = 0.5	
				end
				Money = math.random(3000,11000)
				Exp = math.floor(lvdiffModify *((6 * LvMob + 10) * 6.6 * 4) )* 1.53 * 50
				ExpPartner = math.floor(plvdiffModify * ((4 * LvMob + 10) * 6.6 * 4) )*1.3
				if owner:HasBuff(246) then
					ExpPartner = ExpPartner * 2
				end	
				if owner:HasBuff(247) then
					ExpPartner = ExpPartner * 3
				end	
				owner:ChangeExp(Exp,305)
				owner:ChangeMoney(Money,305)
				owner:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d",Exp))
				owner:GetScript():ShowError(string.format("\#W战斗胜利，获得银两%d",Money))
				local i = math.random(1,100)


        if i < 20 then      
				    item = RandTable({60920,60924,60928,60932,60936,20256})
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O与#Y贪吃小仙#O大打出手中，趁他不注意从他身上抓过一个东西，仔细一看原来是竟然掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 100 then
				  item = RandTable({51900,51901,51902,51903,51906,51905,51906,51907,51908,51909,51910,51911,51912,51913,51914,51915,51916,51917,51918,51919,51920,51921,51922}) 
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打的#Y贪吃小仙#O痛不欲生#O,逼不得已交出一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        end
      end
    end
  end
	if result == LuaI.END_WIN then
		if npc then
			npc:Destroy()
		end
	elseif result == LuaI.END_LOSE and npc then	
		npc:SetEnableBattle(true)	
	end
end
-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat000730)