--透心指

function skill0122CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需隔空点穴修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0122Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.4 * skillLv + 5;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展透心指", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local hitRate = 55 + 2 *(skillLv - Target:GetLevel()) + 1.5 *(Atk:GetSkillLv(378) - Target:GetSkillLv(379));
	
	if hitRate < 10 then
		hitRate = 10;
	elseif hitRate > 95  then
		hitRate = 95;
	end
	
	if math.random(1, 100) > hitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 3 + math.floor((skillLv - Target:GetLevel()) / 5);
	
	if turn < 1 then
		turn = 0;
	elseif turn > 5 then
		turn = 5;
	end
	local result = skillCanHit(Atk, Target);
	if result == 2 then
		Target:MissSkill();
	else
		Target:AddBuff(68, skillLv, 0, 0, turn, 100);
	end
	battle:PushReactionActor(Target);
	
end
