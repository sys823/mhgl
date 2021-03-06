--穿云步

function skill3001CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	local reqHp = 0.2 * Atk:GetMaxHP();	
	local consumeHp = 0.5 * skillLv + 4;
	local consumeSp = 0.3 * skillLv + 2;
	
	if skillLv > 70 then
		consumeHp = 39;
		consumeSp = 23;
	end
	
	if Atk:GetHP() < reqHp then
		local Msg = "\#W生命不足\#G20\%\#W，无法施展穿云步";
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetHP() < consumeHp then
		local Msg1 = string.format("\#W生命不足\#G%d\#W，无法施展穿云步", consumeHp);
		Atk:SkillFail(Msg1);
		do return end
	elseif Atk:GetSP() < consumeSp then
		local Msg2 = string.format("\#W内力不足\#G%d\#W，无法施展穿云步", consumeSp);
		Atk:SkillFail(Msg2);
		do return end
	elseif Atk:HasParty() then
		local Msg = "\#W组队状态下无法施展穿云步";
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(257) or Atk:IsBuffExist(259) or Atk:IsBuffExist(277) or Atk:IsBuffExist(260) then
		Atk:SkillFail("\#W有特殊任务在身，不能使用回门派技能");
	elseif Atk:IsBuffExist(290) or Atk:IsBuffExist(261) then
		Atk:SkillFail("\#W当前不能使用回门派技能");
	elseif Atk:GetMap_id() == 20323 then
		Atk:SkillFail("\#W当前地图不能使用回门派技能");
	end
end

function skill3001Use(Atk, Target, battle, skillLv)
	
	local consumeHp = 0.5 * skillLv + 4;
	local consumeSp = 0.3 * skillLv + 2;
	
	if skillLv > 70 then
		consumeHp = 39;
		consumeSp = 23;
	end
	
	Atk:ChangeHp(-1 * consumeHp);
	Atk:ChangeSp(-1 * consumeSp);
	
	local Rate = 30 + skillLv;
	
	if Rate < 31 then
		Rate = 31;
	elseif Rate > 100 then
		Rate = 100;
	end
	
	if math.random(1, 100) <= Rate then
		Atk:JumpMap(30500, 19, 140);
	else
		Atk:SkillFail("\#W学艺不精，穿云步施展失败");
	end
	
end
