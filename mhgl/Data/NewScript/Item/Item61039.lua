--author: 蒋宇
--同伴如意丹：使用后返回2点已分配的身法点

Item61039 = {
}

function Item61039:MapUse(target)
	if target:GetLock() then 
		ShowHint("已上锁的同伴无法使用")
		return
	end	
	if target:GetRace() == 1 then
		ShowHint("白色人型同伴无法使用该物品")
		return
	end	
	ItemAsk(string.format("你确定要让\#P%s\#W使用如意丹吗？", target:GetName()))
	SetAnswer(1, "确定")
	SetAnswer(2, "取消")			
	WaitAnswer(2)
	if GetAnswer() == 1 then			
		if target:ReverseAttrib(5, 2) then
			if not item:ReduceCount() then return end
			ShowHint("成功返回\#G2\#W点\#P敏捷\#W点数供你重新分配。")
		else
			ShowHint("敏捷属性低于“属性先天值＋等级＋２”，无法使用如意丹。")
		end		
	end
end

function Item61039:CanUse(user, target)
end

function Item61039:BattleUse(user, target)

end

AddItemTable(Item61039)