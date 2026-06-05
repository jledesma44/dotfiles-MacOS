## Basic commands for tmux

1. Creating a new session:

```tmux
:new -s "Session-Name"
```

1. To switch the positions of windows. For example switch window 3 to window 2 position.

```tmux
:swap-window -s 3 -t 2
```

1. create a new tmux window in the current session with a name:

```tmux
:new-window -n "Window-name"
```

1. Rename current window:

```
:rename-window "new-name"
```

```

```

1. Creating a new session:

```tmux
:new -s "Session-Name" /bin/bash
```
