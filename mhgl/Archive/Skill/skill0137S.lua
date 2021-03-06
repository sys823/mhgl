--辟毒术

function skill0137CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需妙手回春修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0137Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.3 * skillLv + 15;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展辟毒术", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local buffid = {78, 98};
	local rate = {0, 0};
	local buffcount = 2;
	local hitRate = 0;
	local rateMax = 0;
	
	local i = 1;
	while i <= buffcount do
		if Target:IsBuffExist(buffid[i]) then
			local buff = Target:FindBuff(buffid[i]);
			rate[i] = buff:GetBuffValue1();
			if rate[i] > rateMax then
				rateMax = rate[i];
			end
		end
		
		i = i + 1;
	end
	
	if rateMax > 0 then
		hitRate = 100 + 2 * (skillLv - rateMax);
		if hitRate < 0 then
			hitRate = 0;
		elseif hitRate > 100 then
			hitRate = 100;
		end
		
		local allfail = 1;
		if math.random(1, 100) <= hitRate then
			i = 1;
			while i <= buffcount do
				Target:RemoveBuff(buffid[i]);
				
				i = i + 1;
			end
			
			allfail = 0;
		else
			i = 1;
			while i <= buffcount do
				if skillLv >= rate[i] then
					Target:RemoveBuff(buffid[i]);
				end
				
				i = i + 1;
			end
			
			allfail = 0;
		end
		
		if allfail == 1 then
			Atk:SkillFail("\#W[战斗讯息]：目标所中之毒等级太高，解除失败");
		end
	end
	
	local turn = 1 + (math.floor(skillLv / 50));				
	if turn < 1 then
		turn = 1;
	elseif turn > 3 then
		turn = 3;
	end	
	Target:AddBuff(35, 0, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
end

