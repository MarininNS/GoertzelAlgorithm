# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

import ft4222
from ft4222.SPI import Cpha, Cpol
from ft4222.SPIMaster import Mode, Clock, SlaveSelect
from ft4222.GPIO import Port, Dir
from time import sleep

read_byte = 0x01
write_byte = 0x00
dummy_byte = 0x00





def test():
    # open 'device' with default description 'FT4222 A'
    device = ft4222.openByDescription('FT4222 A')

    # init spi master
    device.spiMaster_Init(Mode.SINGLE, Clock.DIV_128, Cpol.IDLE_LOW, Cpha.CLK_LEADING, SlaveSelect.SS0)

    # generate data to send
    # data = bytes([x for x in range(256)] * 4)

    # for _ in range(3):
    #     # write data in a single write
    #     device.spiMaster_SingleWrite(data, True)
    #     # wait a short while
    #     sleep(0.5)

    device.spiMaster_SingleWrite(write_byte, False)
    device.spiMaster_SingleWrite(0x00, False)
    device.spiMaster_SingleWrite(0x00, False)
    device.spiMaster_SingleWrite(0x00, False)
    device.spiMaster_SingleWrite(0x00, False)
    device.spiMaster_SingleWrite(0xFF, False)
    device.spiMaster_SingleWrite(0xFF, False)
    device.spiMaster_SingleWrite(0xFF, False)
    device.spiMaster_SingleWrite(0xFF, False)
    device.spiMaster_SingleWrite(dummy_byte, False)
    status = device.spiMaster_SingleRead(0x01, True)

    print(f'{status.hex()}')

    device.spiMaster_SingleWrite(read_byte, False)
    device.spiMaster_SingleWrite(0x00, False)
    device.spiMaster_SingleWrite(0x00, False)
    device.spiMaster_SingleWrite(0x00, False)
    device.spiMaster_SingleWrite(0x00, False)
    device.spiMaster_SingleWrite(dummy_byte, False)
    byte1 = device.spiMaster_SingleRead(0x01, False)
    byte2 = device.spiMaster_SingleRead(0x01, False)
    byte3 = device.spiMaster_SingleRead(0x01, False)
    byte4 = device.spiMaster_SingleRead(0x01, False)
    status = device.spiMaster_SingleRead(0x01, True)

    print(f'{byte1.hex()}')
    print(f'{byte2.hex()}')
    print(f'{byte3.hex()}')
    print(f'{byte4.hex()}')
    print(f'{status.hex()}')


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    test()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
