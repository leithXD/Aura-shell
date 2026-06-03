import Quickshell
import Quickshell.Wayland
import qs.Core
import "modules/Bar"
import "modules/Lock"
import "modules/Background"
import "modules/MiddlePellet"
import "services/Ipc"

ShellRoot {
    Background {}
    MiddlePellet {}
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
