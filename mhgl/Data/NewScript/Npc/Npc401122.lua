-- 补偿大师 每日礼物 510
Npc00510 = {}
Npc00510.npc_id = 510
Npc00510.name = GetNpcName(510)

Npc00510.Talk = function(l_1_0, l_1_1)
  
  if npc then
    local TotalRound6110 = 0
    local type6110 = player:GetQuests():GetType(18888)
	local flag = player:GetQuests():GetFlag(80086)
    if type6110 ~= nil then
      TotalRound6110 = type6110:GetTotalRound()
    end
    NpcAsk(string.format("%s \\r#E我乃本服最帅最牛逼没有之一，赶紧膜拜吧！哇哈哈哈......\\r你对此人信仰指数为：#Y%d#P",player:GetName(), flag))
  --SetAnswer(1, "膜拜")
	--SetAnswer(2, "VIP签到")
    --SetAnswer(3, "签到积分兑换")
	--SetAnswer(3, "\230\137\147\233\128\160\49\48\48\45\49\52\48\232\163\133\229\164\135")
	--SetAnswer(4, "\230\137\147\233\128\160\229\133\137\230\173\166\230\173\166\229\153\168")
    SetAnswer(5, "我艹你妹")
    WaitAnswer(5)
    if GetAnswer() == 1 then
        if TotalRound6110 >= 1 then
          ShowHint("每天只能选一人膜拜一次")
          return
        end
      if player:GetLevel() < 90 then
      ShowHint("90级以下的战五渣，我不接受你的膜拜")
      return 
    end
        if l_1_1 then
          if type6110 == nil then
            player:GetQuests():SetRoundInfo(18888, 1, 1, 1)
            type6110 = player:GetQuests():GetType(18888)
            type6110:ChangeTotalRound(1)
          else
            type6110:ChangeTotalRound(1)
          end
          --发奖励
			
            player:ChangeGDonate(50000)			
			-- player:ChangeVP(500)
			  end
			          NpcSay("领取成功")
		end
    if GetAnswer() == 2 then
        if TotalRound610 >= 1 then
          ShowHint("\228\189\160\228\187\138\229\164\169\229\183\178\231\187\143\231\173\190\229\136\176\232\191\135\228\186\134")
          return
        end
    if player:GetItems():GetItemCount(51402) < 1 then
      NpcSay("不是VIP，请不要围观！")
      return 
    end
        if l_1_1 then
          if type610 == nil then
            player:GetQuests():SetRoundInfo(8888, 1, 1, 1)
            type610 = player:GetQuests():GetType(8888)
            type610:ChangeTotalRound(1)
          else
            type610:ChangeTotalRound(1)
          end
          --发奖励
		      player:GetQuests():SetFlag(198791, flag + 1)
              player:ChangeMoney(50000)
		  player:ChangeExpForScript(500000, 1)
		  player:GetItems():AddItem(401669, 1)
          --player:GetItems():AddItemForScript(402747, 1)       
          script:Rumor(string.format("#A %s #O在京城#A【心鉴大师】#O那里VIP签到，获得#B银两5W经验50W绑定元宝100#O！#020奖历虽少，但也是本服对大家的一点小心意，各位可要坚持哟#029", player:GetCharNameLink(),GetItemName(61021)), false)
       	end
		end		
    if GetAnswer() == 3 then
	script:SetSaying(true)
		NpcAsk(string.format("祝您购物愉快！\r你的签到天数为：#R %d", flag))
		--SetAnswer(1, "兑换吸血鬼宝宝（15天）")
		--SetAnswer(2, "兑换盛世重阳糕X5（1天）")
		--SetAnswer(3, "兑换秘制资质丹礼包（1天）")
		--SetAnswer(4, "兑换修炼丹盒X1（2天）")
		--SetAnswer(5, "兑换1000绑定元宝卡（2天）")
		--SetAnswer(6, "兑换成长丹（15天）")
		SetAnswer(7, "兑换1高级兽决宝盒（2天）")
		--SetAnswer(8, "兑换绝学福袋（20天）")
		--SetAnswer(9, "兑换大侠福袋（12天）")
		SetAnswer(10, "兑换30天VIP卡（40天）")
		SetAnswer(12, "我就看看")
		WaitAnswer(13)
	if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(198791)
      script:SetSaying(true)
      if flag < 15 then
        NpcSay("你的签到天数不足#R15#W天")
        return
      end
      player:GetQuests():SetFlag(198791, flag - 15)
      player:GetPartners():AddPartner(RandTable({7041,7041}), 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R吸血鬼宝宝#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(198791)
      script:SetSaying(true)
      if flag < 1 then
        NpcSay("你的签到天数不足#R1#W天")
        return
      end
      player:GetQuests():SetFlag(198791, flag - 1)
      player:GetItems():AddItem(64304, 5)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了5个#R盛世重阳糕#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(198791)
      script:SetSaying(true)
      if flag < 1 then
        NpcSay("你的签到天数不足#R1#W天")
        return
      end
      player:GetQuests():SetFlag(198791, flag - 1)
      player:GetItems():AddItem(401647, 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R秘制资质丹礼包#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(198791)
      script:SetSaying(true)
      if flag < 1 then
        NpcSay("你的签到天数不足#R1#W天")
        return
      end
      player:GetQuests():SetFlag(198791, flag - 1)
      player:GetItems():AddItem(80055, 2)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R修炼丹盒X2#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(198791)
      script:SetSaying(true)
      if flag < 2 then
        NpcSay("你的签到天数不足#R2#W天")
        return
      end
      player:GetQuests():SetFlag(198791, flag - 2)
      player:GetItems():AddItem(401670, 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R绑定元宝卡（大）#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(198791)
      script:SetSaying(true)
      if flag < 15 then
        NpcSay("你的签到天数不足#R15#W天")
        return
      end
      player:GetQuests():SetFlag(198791, flag - 15)
      player:GetItems():AddItem(401643, 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R成长丹#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(198791)
      script:SetSaying(true)
      if flag < 2 then
        NpcSay("你的签到天数不足#R2#W天")
        return
      end
      player:GetQuests():SetFlag(198791, flag - 2)
      player:GetItems():AddItem(63060, 3)
      script:Rumor(string.format("#E %s #O用签到积分兑换了一个#R高级兽诀宝盒X3#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(198791)
      script:SetSaying(true)
      if flag < 20 then
        NpcSay("你的签到天数不足#R20#W天")
        return
      end
      player:GetQuests():SetFlag(198791, flag - 20)
      player:GetItems():AddItem(401646, 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R绝学福袋#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(198791)
      script:SetSaying(true)
      if flag < 12 then
        NpcSay("你的签到天数不足#R12#W天")
        return
      end
      player:GetQuests():SetFlag(198791, flag - 12)
      player:GetItems():AddItem(401644, 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R大侠福袋#28", player:GetName()), false)
      player:GetOwner()
    end
	if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(198791)
      script:SetSaying(true)
      if flag < 40 then
        NpcSay("你的签到天数不足#R40#W天")
        return
      end
      player:GetQuests():SetFlag(198791, flag - 45)
      player:GetItems():AddItem(51402, 1)
      script:Rumor(string.format("#Y[心鉴]#E %s #O用签到积分兑换了一个#R30天VIP卡#28", player:GetName()), false)
      player:GetOwner()
    end	
    elseif GetAnswer() == 3 then
          NpcAsk("\232\175\183\233\128\137\230\139\169\239\188\140\228\189\160\232\166\129\230\137\147\233\128\160\231\154\132\232\163\133\229\164\135\239\188\129")
          SetAnswer(1, "\230\137\147\233\128\160\230\173\166\229\153\168")
          SetAnswer(2, "\230\137\147\233\128\160\233\152\178\229\133\183")
          SetAnswer(3, "\230\137\147\233\128\160\233\165\176\229\147\129")
          SetAnswer(4, "\230\154\130\230\151\182\228\184\141\230\137\147\233\128\160")
          WaitAnswer(4)
          if GetAnswer() == 1 and l_1_1 then
            script:OpenInterface("mixshop", 9)
          elseif GetAnswer() == 2 and l_1_1 then
            script:OpenInterface("mixshop",12)
          elseif GetAnswer() == 3 and l_1_1 then
            script:OpenInterface("mixshop",15)
          end
    elseif GetAnswer() == 4 then
         script:OpenInterface("mixshop", 20) 
    else  
      --type610:ChangeTotalRound(-1)
    end
  end
end
AddNpcTable(Npc00510)
