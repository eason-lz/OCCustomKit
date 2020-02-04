`import "GCDTimer.h"`

`**@property** (**copy**, **nonatomic**) NSString *task;`

`**self**.task = [GCDTimer execTask:**self** selector:**@selector**(doTask) start:2.0 interval:1.0 repeats:**YES** async:**NO**];`

`[GCDTimer cancelTask:**self**.task];`

