open_system('newsimul');
open_system('gm_newsimul');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'gray';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_newsimul/Subsystem/Subsystem', 'user2');
annotate_port('gm_newsimul/Subsystem/Subsystem', 1, 1, 'Obstacle to clock-rate pipelining');
hilite_system('newsimul/Subsystem/Subsystem', 'user2');
annotate_port('newsimul/Subsystem/Subsystem', 1, 1, 'Obstacle to clock-rate pipelining');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'gray';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_newsimul/Subsystem/Subsystem/Deserializer1D', 'user2');
annotate_port('gm_newsimul/Subsystem/Subsystem/Deserializer1D', 1, 1, 'Obstacle to clock-rate pipelining');
hilite_system('newsimul/Subsystem/Subsystem/Deserializer1D', 'user2');
annotate_port('newsimul/Subsystem/Subsystem/Deserializer1D', 1, 1, 'Obstacle to clock-rate pipelining');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'gray';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_newsimul/Subsystem/Subsystem/Channelizer', 'user2');
annotate_port('gm_newsimul/Subsystem/Subsystem/Channelizer', 1, 1, 'Unsupported block for clock-rate pipelining');
hilite_system('newsimul/Subsystem/Subsystem/Channelizer', 'user2');
annotate_port('newsimul/Subsystem/Subsystem/Channelizer', 1, 1, 'Unsupported block for clock-rate pipelining');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'gray';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_newsimul/Subsystem/Subsystem/Channelizer', 'user2');
annotate_port('gm_newsimul/Subsystem/Subsystem/Channelizer', 1, 1, 'Unsupported block for clock-rate pipelining');
hilite_system('newsimul/Subsystem/Subsystem/Channelizer', 'user2');
annotate_port('newsimul/Subsystem/Subsystem/Channelizer', 1, 1, 'Unsupported block for clock-rate pipelining');
