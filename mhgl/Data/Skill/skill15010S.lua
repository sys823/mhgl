--秋波暗送

function skill15010Attri(Char, skillLv, Attri) 
	--local increaseValue1 = skillLv * 1.5 + 0.005 * skillLv ^ 2;
	local increaseValue2 = skillLv;
	--local increaseValue3 = skillLv * 2.1 + 0.007 * skillLv ^ 2;
	--local increaseValue4 = skillLv * 2.4 + 0.008 * skillLv ^ 2;
	local increaseValue5 = skillLv*3;
	--Attri:SetEva(Attri:GetEva() + increaseValue1 / 5);
	Attri:SetAtk(Attri:GetAtk() + increaseValue2 / 5);
	--Attri:SetPow(Attri:GetPow() + increaseValue3 / 5);
	--Attri:SetDef(Attri:GetDef() + increaseValue4 / 5);
	Attri:SetHit(Attri:GetHit() + increaseValue5 / 5);
end
