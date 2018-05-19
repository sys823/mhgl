
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00686 = {							-- 孙小红
	npc_id = 686,						-- NPC ID
	name = GetNpcName(686),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00686:Talk(bProcess) 
--[[
  NpcAsk("奉唐王之命,为了表彰我大唐盛世的英雄豪杰,人物总经验满10000000000(1后面好多个……0好像是10个,嗯~)的高手,可以到我这里领取唐王特赐的纪念版名号,数量有限,先到先得,送完为止。")
  SetAnswer(1,"我就是传说中的高人")
  SetAnswer(3,"这里好像没我什么事")
  WaitAnswer(3)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end--]]

        
  NpcAsk("朝廷要求我们户部都要走亲民路线,所以我们大人已换了公办地点了,您可以在长安皇宫门口(139.178)副本官员旁边找到他")
	SetAnswer(1,"离开")
	WaitAnswer(1)
end









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00686)
