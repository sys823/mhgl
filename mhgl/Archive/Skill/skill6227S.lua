--MOB上官金虹-龙翔凤舞

function skill6227CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6227Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 3 * Lv;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
		
	if Atk:GetSP() < consumeSp then		
		do return end
	end
	
	Atk:ChangeSp(-1 * Atk:GetSP(), false);
	
	local skill1 = Atk:GetSkillLv(5300);
	local skill2 = Atk:GetSkillLv(5302);
	local targetlist = {};
	local maxTargetCount = 6;	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then			
			local wDam = 1;
			local PartnerOwner;			--是CBatActor类型 
			if targetlist[i]:IsParnter() then
				local pBatMob = targetlist[i]:ToBatMob();
				if pBatMob ~= nil then
					for ii=0, battle:GetActorCount() - 1 do
						local pActor = battle:GetActor(ii);
						if pActor:IsPlayer() then
							local pBatChar = pActor:ToBatChar();
							if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
								PartnerOwner = pActor;
								wDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(382);
							end
						end
					end
				end
			else
				wDam =0.98 ^ targetlist[i]:GetSkillLv(376);
			end
			
			local randomDam = 1.2 - math.random(100, 300) / 1000;
			local critDam = 2.0;
			local FinalDef = targetlist[i]:GetDEF();
			local FinalPow = targetlist[i]:GetPOW();
			if 0.8 * Atk:GetATK() > targetlist[i]:GetDEF() then
				if math.random(1, 100) <= 5 then
					FinalDef = targetlist[i]:GetDEF() / 2;
				end
			end
			
			local FinalDam = 0;
			local CritHit = 0;
			local CritRate =  5;			
			if math.random(1,100) <= CritRate then				 
				FinalDam = ((1.2 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = ((1.2 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;
			end
			
			
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 2;
				Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
				if CritHit == 1 then
					targetlist[i]:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
				end
			end
			if  FinalDam <= 10 then
				FinalDam = math.random(1, 10);
			end
			
			local result = skillCanHit(Atk,targetlist[i]);
			if result == 2 then
				targetlist[i]:MissSkill();
			else
				--targetlist[i]:ChangeHp(-1 * FinalDam);
				targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
			end
			
			if CritHit == 1 then
				targetlist[i]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			end
			
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
end

