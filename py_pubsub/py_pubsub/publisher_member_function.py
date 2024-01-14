import rclpy
from rclpy.node import Node
from std_msgs.msg import String

# This node is used for starting and shutting down different systems on the rover.
# This node starts on system startup and is always running.
# It also acts as a watchdog for the other systems.
# This system manager runs on the rover.

class SystemManager(Node):

    def __init__(self):

        super().__init__('system_manager')

        self.publisher_ = self.create_publisher(String, '/system/system_watchdog', 10)

        self.subscription = self.create_subscription(
            String,
            '/system/network_watchdog',
            self.network_watchdog_callback,
            10)
        self.subscription  # prevent unused variable warning

        timer_period = 1/2  # 2Hz
        self.timer = self.create_timer(timer_period, self.timer_callback)

    def timer_callback(self):
        self.publisher_.publish(msg)


def main(args=None):
    rclpy.init(args=args)

    system_manager = SystemManager()

    rclpy.spin(system_manager)

    # Destroy the node explicitly
    # (optional - otherwise it will be done automatically
    # when the garbage collector destroys the node object)
    system_manager.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
