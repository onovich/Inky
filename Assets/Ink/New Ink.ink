EXTERNAL ShowAlert(x) // ShowAlert("message")：显示警报消息。
EXTERNAL Sequence(x) // Sequence("sequence")：在字符串 x 中播放音序器命令。注意：使用 [[x]] 而不是 {{x}} 作为快捷方式。
EXTERNAL CurrentQuestState(x) // CurrentQuestState("quest")：返回当前任务状态。
EXTERNAL CurrentQuestEntryState(x,y) // CurrentQuestEntryState("quest", entry#)：返回当前任务进入状态。
EXTERNAL SetQuestState(x,y) // SetQuestState("quest", "inactive|active|success|failure")：设置一个任务状态。
EXTERNAL SetQuestEntryState(x,y,z) // SetQuestEntryState("quest", entry#, "inactive|active|success|failure")：设置任务入口状态。
EXTERNAL GetBoolVariable(x) // 返回对话系统变量 x 的布尔值。
EXTERNAL GetIntVariable(x) // 返回对话系统变量 x 的 int 值。
EXTERNAL GetStringVariable(x) // 返回对话系统变量 x 的字符串值。
EXTERNAL SetBoolVariable(x,y) // 将对话系统变量 x 设置为 bool y 的值。
EXTERNAL SetIntVariable(x,y) // 将对话系统变量 x 设置为 int y 的值。
EXTERNAL SetStringVariable(x,y) // 将对话系统变量 x 设置为字符串 y 的值。

VAR boring = 0

->start
===start===
世界之心: 你醒来，周围都是树。 
你站在密林中，你意识到。# Actor=虚空 
你需要做点什么。# Actor=虚空 # Conversant=亚当
# Actor=亚当 # Conversant=负亚当
+ 砍树# Actor=亚当
    亚当: 获得木片+1# Actor=亚当
    ~ boring++
    ->start
+ 采石# Actor=亚当
    获得石头+1# Actor=亚当
     ~ boring++
    ->start
+ 探索# Actor=亚当
    获得新视野+1# Actor=亚当
     ~ boring++
    ->start
# Actor=亚当

+ {boring>3}抱怨
    太累了
    ->end0

===end0===
# Actor=世界之心 
还能怎么办呢.
{boring>4:完结了吧。} 
->DONE







// Fallback functions
== function ShowAlert(x) ==
~ return 1
== function Sequence(x) ==
~ return 1
== function CurrentQuestState(x) ==
~ return "inactive"
== function CurrentQuestEntryState(x,y) ==
~ return "inactive"
== function SetQuestState(x,y) ==
~ return 1
== function SetQuestEntryState(x,y,z) ==
~ return 1
== function GetBoolVariable(x) ==
~ return false
== function GetIntVariable(x) ==
~ return 1
== function GetStringVariable(x) ==
~ return ""
== function SetBoolVariable(x,y) ==
~ return 1
== function SetIntVariable(x,y) ==
~ return 1
== function SetStringVariable(x,y) ==
~ return 1