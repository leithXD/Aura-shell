import Quickshell
import Quickshell.Wayland
import qs.Core
import "modules/Bar"
import "modules/Lock"
import "services/Ipc"

ShellRoot {
    Ipc {}
    Bar {}
    LockContext {
        id: lockContext

        onUnlocked: {
            ShellState.locked = false;
        }
    }

    WlSessionLock {
        id: lock

        locked: ShellState.locked

        WlSessionLockSurface {
            LockSurface {
                anchors.fill: parent
                context: lockContext
            }
        }
    }
}
