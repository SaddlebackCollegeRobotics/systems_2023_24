import sys
from subprocess import Popen, DEVNULL


def main():
    processes = []
    for arg in sys.argv[1:]:
        processes.append(
            Popen(
                arg.split(" "),
                stdin=DEVNULL,
                stdout=DEVNULL,
                stderr=DEVNULL,
            )
        )

    try:
        while True:
            pass
    except KeyboardInterrupt:
        for proc in processes:
            proc.terminate()


if __name__ == "__main__":
    main()
