Item40031 = {
}
function Item40031:MapUse(target)                --导标旗
  local mapId = player:GetMap_id();
  if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30604)or player:GetQuests():HasQuest(30605)then
			ShowHint(string.format("\#P%s\#W有跑镖任务无法使用", player:GetName()))
			return
		end
		if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
			ShowHint(string.format("\#P%s\#W有跑商任务无法使用", player:GetName()))
			return
		end
  if mapId == 252 then
	 ShowHint(string.format("\#P%s\#W在苦行虚空受刑,不能传送", player:GetName()))
	 return
	end
	if party then --组队
	  for i = 0, party:GetRealMemNum() - 1 do
	    local member = party:GetInPartyMember(i)
			local mapId = member:GetMap_id();
	  	if mapId == 252 then
		    ShowHint(string.format("\#P%s\#W在苦行虚空受刑,不能传送", member:GetName()))
		    return
		  end
		end
  end
  IAsk("请问需要传送去哪里儿?")
  SetAnswer(1,"麒麟山")
  SetAnswer(2,"大唐境外")
  SetAnswer(3,"丝绸之路")
  SetAnswer(4,"神机道长")
  SetAnswer(5,"驿站老板")
  SetAnswer(6,"申太公")
  SetAnswer(7,"中间")
  SetAnswer(8,"算了")
  WaitAnswer(8)
  if GetAnswer() == 1 then
    if party then
      for i = 0, party:GetRealMemNum() - 1 do
        local member = party:GetInPartyMember(i)
        if member:GetLevel() < 10 then
          ShowHint(string.format("#P%s#W等级小于10级无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(30601) or member:GetQuests():HasQuest(30602) or member:GetQuests():HasQuest(30603) or member:GetQuests():HasQuest(30615) or member:GetQuests():HasQuest(30616) then
          ShowHint(string.format("#P%s#W有跑镖任务无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(80001) or member:GetQuests():HasQuest(80002) or member:GetQuests():HasQuest(80003) or member:GetQuests():HasQuest(80004) then
          ShowHint(string.format("#P%s#W有跑商任务无法使用", member:GetName()))
          return 
        end
        if member:HasBuff(290) then
          ShowHint("当前状态禁止使用该物品")
          return 
        end
		  	local mapId = member:GetMap_id();
	  	  if mapId == 252 then
		      ShowHint(string.format("\#P%s\#W在苦行虚空受刑,不能传送", member:GetName()))
		      return
		    end
      end
    else
      if player:GetLevel() < 10 then
        ShowHint("等级小于10级无法使用")
        return 
      end
      if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30615) or player:GetQuests():HasQuest(30616) then
        ShowHint("跑镖状态下不能使用导标旗")
        return 
      end
      if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
        ShowHint("跑商状态下不可以使用导标旗。")
        return 
      end
      if player:HasBuff(290) then
        ShowHint("当前状态禁止使用该物品")
        return 
      end
    end
    if not item:ReduceCount() then
      return 
    end
    player:JumpMap(84,10,58)
  elseif GetAnswer() == 2 then
    if party then
      for i = 0, party:GetRealMemNum() - 1 do
        local member = party:GetInPartyMember(i)
        if member:GetLevel() < 10 then
          ShowHint(string.format("#P%s#W等级小于10级无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(30601) or member:GetQuests():HasQuest(30602) or member:GetQuests():HasQuest(30603) or member:GetQuests():HasQuest(30615) or member:GetQuests():HasQuest(30616) then
          ShowHint(string.format("#P%s#W有跑镖任务无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(80001) or member:GetQuests():HasQuest(80002) or member:GetQuests():HasQuest(80003) or member:GetQuests():HasQuest(80004) then
          ShowHint(string.format("#P%s#W有跑商任务无法使用", member:GetName()))
          return 
        end
        if member:HasBuff(290) then
          ShowHint("当前状态禁止使用该物品")
          return 
        end
		  	local mapId = member:GetMap_id();
	  	  if mapId == 252 then
		      ShowHint(string.format("\#P%s\#W在苦行虚空受刑,不能传送", member:GetName()))
		      return
		    end
      end
    else
      if player:GetLevel() < 10 then
        ShowHint("等级小于10级无法使用")
        return 
      end
      if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30615) or player:GetQuests():HasQuest(30616) then
        ShowHint("跑镖状态下不能使用导标旗")
        return 
      end
      if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
        ShowHint("跑商状态下不可以使用导标旗。")
        return 
      end
      if player:HasBuff(290) then
        ShowHint("当前状态禁止使用该物品")
        return 
      end
    end
    if not item:ReduceCount() then
      return 
    end
    player:JumpMap(84,4,284)
  elseif GetAnswer() == 3 then
    if party then
      for i = 0, party:GetRealMemNum() - 1 do
        local member = party:GetInPartyMember(i)
        if member:GetLevel() < 10 then
          ShowHint(string.format("#P%s#W等级小于10级无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(30601) or member:GetQuests():HasQuest(30602) or member:GetQuests():HasQuest(30603) or member:GetQuests():HasQuest(30615) or member:GetQuests():HasQuest(30616) then
          ShowHint(string.format("#P%s#W有跑镖任务无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(80001) or member:GetQuests():HasQuest(80002) or member:GetQuests():HasQuest(80003) or member:GetQuests():HasQuest(80004) then
          ShowHint(string.format("#P%s#W有跑商任务无法使用", member:GetName()))
          return 
        end
        if member:HasBuff(290) then
          ShowHint("当前状态禁止使用该物品")
          return 
        end
      end
    else
      if player:GetLevel() < 10 then
        ShowHint("等级小于10级无法使用")
        return 
      end
      if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30615) or player:GetQuests():HasQuest(30616) then
        ShowHint("跑镖状态下不能使用导标旗")
        return 
      end
      if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
        ShowHint("跑商状态下不可以使用导标旗。")
        return 
      end
      if player:HasBuff(290) then
        ShowHint("当前状态禁止使用该物品")
        return 
      end
    end
    if not item:ReduceCount() then
      return 
    end
    player:JumpMap(84,86,280)
  elseif GetAnswer() == 4 then
    if party then
      for i = 0, party:GetRealMemNum() - 1 do
        local member = party:GetInPartyMember(i)
        if member:GetLevel() < 10 then
          ShowHint(string.format("#P%s#W等级小于10级无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(30601) or member:GetQuests():HasQuest(30602) or member:GetQuests():HasQuest(30603) or member:GetQuests():HasQuest(30615) or member:GetQuests():HasQuest(30616) then
          ShowHint(string.format("#P%s#W有跑镖任务无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(80001) or member:GetQuests():HasQuest(80002) or member:GetQuests():HasQuest(80003) or member:GetQuests():HasQuest(80004) then
          ShowHint(string.format("#P%s#W有跑商任务无法使用", member:GetName()))
          return 
        end
        if member:HasBuff(290) then
          ShowHint("当前状态禁止使用该物品")
          return 
        end
      end
    else
      if player:GetLevel() < 10 then
        ShowHint("等级小于10级无法使用")
        return 
      end
      if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30615) or player:GetQuests():HasQuest(30616) then
        ShowHint("跑镖状态下不能使用导标旗")
        return 
      end
      if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
        ShowHint("跑商状态下不可以使用导标旗。")
        return 
      end
      if player:HasBuff(290) then
        ShowHint("当前状态禁止使用该物品")
        return 
      end
    end
    if not item:ReduceCount() then
      return 
    end
    player:JumpMap(84,46,50)
  elseif GetAnswer() == 5 then
    if party then
      for i = 0, party:GetRealMemNum() - 1 do
        local member = party:GetInPartyMember(i)
        if member:GetLevel() < 10 then
          ShowHint(string.format("#P%s#W等级小于10级无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(30601) or member:GetQuests():HasQuest(30602) or member:GetQuests():HasQuest(30603) or member:GetQuests():HasQuest(30615) or member:GetQuests():HasQuest(30616) then
          ShowHint(string.format("#P%s#W有跑镖任务无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(80001) or member:GetQuests():HasQuest(80002) or member:GetQuests():HasQuest(80003) or member:GetQuests():HasQuest(80004) then
          ShowHint(string.format("#P%s#W有跑商任务无法使用", member:GetName()))
          return 
        end
        if member:HasBuff(290) then
          ShowHint("当前状态禁止使用该物品")
          return 
        end
      end
    else
      if player:GetLevel() < 10 then
        ShowHint("等级小于10级无法使用")
        return 
      end
      if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30615) or player:GetQuests():HasQuest(30616) then
        ShowHint("跑镖状态下不能使用导标旗")
        return 
      end
      if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
        ShowHint("跑商状态下不可以使用导标旗。")
        return 
      end
      if player:HasBuff(290) then
        ShowHint("当前状态禁止使用该物品")
        return 
      end
    end
    if not item:ReduceCount() then
      return 
    end
    player:JumpMap(84,36,193)
  elseif GetAnswer() == 6 then
    if party then
      for i = 0, party:GetRealMemNum() - 1 do
        local member = party:GetInPartyMember(i)
        if member:GetLevel() < 10 then
          ShowHint(string.format("#P%s#W等级小于10级无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(30601) or member:GetQuests():HasQuest(30602) or member:GetQuests():HasQuest(30603) or member:GetQuests():HasQuest(30615) or member:GetQuests():HasQuest(30616) then
          ShowHint(string.format("#P%s#W有跑镖任务无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(80001) or member:GetQuests():HasQuest(80002) or member:GetQuests():HasQuest(80003) or member:GetQuests():HasQuest(80004) then
          ShowHint(string.format("#P%s#W有跑商任务无法使用", member:GetName()))
          return 
        end
        if member:HasBuff(290) then
          ShowHint("当前状态禁止使用该物品")
          return 
        end
      end
    else
      if player:GetLevel() < 10 then
        ShowHint("等级小于10级无法使用")
        return 
      end
      if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30615) or player:GetQuests():HasQuest(30616) then
        ShowHint("跑镖状态下不能使用导标旗")
        return 
      end
      if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
        ShowHint("跑商状态下不可以使用导标旗。")
        return 
      end
      if player:HasBuff(290) then
        ShowHint("当前状态禁止使用该物品")
        return 
      end
    end
    if not item:ReduceCount() then
      return 
    end
    player:JumpMap(84,46,270)
  elseif GetAnswer() == 7 then
    if party then
      for i = 0, party:GetRealMemNum() - 1 do
        local member = party:GetInPartyMember(i)
        if member:GetLevel() < 10 then
          ShowHint(string.format("#P%s#W等级小于10级无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(30601) or member:GetQuests():HasQuest(30602) or member:GetQuests():HasQuest(30603) or member:GetQuests():HasQuest(30615) or member:GetQuests():HasQuest(30616) then
          ShowHint(string.format("#P%s#W有跑镖任务无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(80001) or member:GetQuests():HasQuest(80002) or member:GetQuests():HasQuest(80003) or member:GetQuests():HasQuest(80004) then
          ShowHint(string.format("#P%s#W有跑商任务无法使用", member:GetName()))
          return 
        end
        if member:HasBuff(290) then
          ShowHint("当前状态禁止使用该物品")
          return 
        end
      end
    else
      if player:GetLevel() < 10 then
        ShowHint("等级小于10级无法使用")
        return 
      end
      if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30615) or player:GetQuests():HasQuest(30616) then
        ShowHint("跑镖状态下不能使用导标旗")
        return 
      end
      if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
        ShowHint("跑商状态下不可以使用导标旗。")
        return 
      end
      if player:HasBuff(290) then
        ShowHint("当前状态禁止使用该物品")
        return 
      end
    end
    if not item:ReduceCount() then
      return 
    end
    player:JumpMap(84,100,135)
  end
end


	

AddItemTable(Item40031)