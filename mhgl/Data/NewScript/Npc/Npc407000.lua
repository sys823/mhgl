-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\Server\Data\NewScript\NPC00395.out 

Npc000395 = {npc_id = 395, name = GetNpcName(395)}
Npc000395.Talk = function(l_1_0, l_1_1)
  NpcAsk({"芭蕉、芭蕉、芭蕉、、、、、"})
  SetAnswer(1, "啊打")
  SetAnswer(2, "打酱油")
  WaitAnswer(2)
  local answer = GetAnswer()
  if answer == 1 then
    local cardnum = 0
    if not party then
       NpcSay(string.format("#W唉，#P%s#W，你队都不组，我劝你还是别来挑战了，早点回去，洗洗睡吧！", player:GetName()))
       return 
    end
      for i = 0, party:GetCount() - 1 do
        local member = party:GetMember(i)
        local qtype = member:GetQuests():GetType(407000)
        local TotalRound407000 = 0
        if qtype ~= nil then
          TotalRound407000 = qtype:GetTotalRound()
        end
        if qtype == nil or TotalRound407000 < 1 then
          if member:GetLevel() >= 69 then
	   if player:GetLevel() < 69 then
		ShowHint("看我嘴形“滚-滚-滚”")
		return false
		end	
          else
            NpcSayParty(string.format("#P%s#W,你连69级都不到，我实在不想出手打击你那颗脆弱而幼小的心啊！", member:GetName()))
            return 
          end
        else
          NpcSayParty(string.format("#P%s#W你烦不烦啊？明天请早吧。", member:GetName()))
          return 
        end
      end
if l_1_1 then
  for i = 0, party:GetCount() - 1 do
      --[[local member = party:GetMember(i)
      if member:GetItems():GetItemCount() > 0 then
         member:GetItems():RemoveItem()
      elseif member:GetItems():GetItemCount() > 0 then
         member:GetItems():RemoveItem()
      end]]
  end
end



if l_1_1 then
  for i = 0, party:GetCount() - 1 do
    local member = party:GetMember(i)
    local type407000 = member:GetQuests():GetType(407000)
    if qtype == nil then
      member:GetQuests():SetRoundInfo(407000, 1, 1, 1)
      type407000 = member:GetQuests():GetType(407000)
      type407000:ChangeTotalRound(1)
    else
      type407000:ChangeTotalRound(1)
    end
  end
  player:EncounterBattle(407000)
end
   end
end

AddNpcTable(Npc000395)

