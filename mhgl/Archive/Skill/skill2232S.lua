--饰鉴秘术

function skill2232CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需无忧秘法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	else
		Atk:SkillFail("此技能为被动技能，可到京城状元楼找朱停制作饰品图鉴");
	end
end

function skill2232Use(Atk, Target, battle, skillLv)
end
