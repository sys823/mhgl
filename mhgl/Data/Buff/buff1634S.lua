--封筋闭脉手

function buff1634Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local skillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if ((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and
			skillForm == 2) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			local sectrate = 0;
			if Char:IsBuffExist(1710) then
				sectrate = 0.125
			end
			if reDam1 > 0 then
				Char:ResetHP();	
				if (Char:IsBuffExist(1115) or Char:IsBuffExist(1116)) and not Char:IsBuffExist(1409) then
					reDam1 = reDam1 * (0.85 + sectrate);
				elseif Char:IsBuffExist(1409) then
					reDam1 = reDam1 * (0.825 + sectrate);
				else	
					reDam1 = reDam1 * (0.75 + sectrate);
				end				
				Char:ChangeHp(-1 * reDam1);
			end
			if reDam2 > 0 then
				Char:ResetSP();
				if (Char:IsBuffExist(1115) or Char:IsBuffExist(1116)) and not Char:IsBuffExist(1409) then
					reDam2 = reDam2 * (0.85 + sectrate);
				elseif Char:IsBuffExist(1409) then
					reDam2 = reDam2 * (0.825 + sectrate);
				else	
					reDam2 = reDam2 * (0.75 + sectrate);
				end		
				Char:ChangeSp(-1 * reDam2);
			end
			if reDam3 > 0 then
				Char:ResetMHP();
				if (Char:IsBuffExist(1115) or Char:IsBuffExist(1116)) and not Char:IsBuffExist(1409) then
					reDam3 = reDam3 * (0.85 + sectrate);
				elseif Char:IsBuffExist(1409) then
					reDam3 = reDam3 * (0.825 + sectrate);
				else	
					reDam3 = reDam3 * (0.75 + sectrate);
				end		
				Char:ChangeMHp(-1 * reDam3);
			end
		end
	end
end
