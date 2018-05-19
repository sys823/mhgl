--太极无量气

function buff21069Active(buff, Char, Other, Type)
	local i = buff:GetBuffValue2();
	
	if Type == TURN_END then
		i = i + 1;
		buff:SetBuffValue2(i);
		if i <= 5 then
			Char:BuffActive();
		end
	end
		
	if i <= 5 then
		if Type == DO_HITTING then
				
				local reDam1 = -1 * Char:GetDHP();
				local reDam2 = -1 * Char:GetDSP();
				local reDam3 = -1 * Char:GetDMHP();
				
				local skillForm = 0;
				local csv = Other:GetSkillCsvData(Other:GetSubType());
				if csv ~= nil then
					skillForm = csv.form;
				end
				
				if 	((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or 
					Other:GetAction() == LuaI.BATCMD_SPECIAL) and skillForm == 2) and 
					(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and not Char:IsBuffExist(2074) and not Char:IsBuffExist(21072) and 
					Char:GetReaction() ~= LuaI.BATCMD_MISS then
					
					if reDam1 > 0 then
						Char:ResetHP();	
						reDam1 = reDam1 * 0.75;
						Char:ChangeHp(-1 * reDam1);
					end
					if reDam2 > 0 then
						Char:ResetSP();
						reDam2 = reDam2 * 0.75;
						Char:ChangeSp(-1 * reDam2);
					end
					if reDam3 > 0 then
						Char:ResetMHP();
						reDam3 = reDam3 * 0.75;
						Char:ChangeMHp(-1 * reDam3);
					end
				end
			end
	end
end