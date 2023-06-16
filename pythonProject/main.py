import ft4222
from ft4222.SPI import Cpha, Cpol
from ft4222.SPIMaster import Mode, Clock, SlaveSelect
from time import sleep

VERSION    = 0x0000_0000  # RW
DEBUG      = 0x0000_0004  # RW
MODE       = 0x0000_0008  # RW
NUM_SAMP   = 0x0000_000C  # RW
SAMP_FREQ  = 0x0000_0010  # RW
EN_CORDIC  = 0x0000_0014  # RW
STATUS     = 0x0000_0018  # R
RESET_ALL  = 0x0000_001C  # RW
RESET_H    = 0x0000_0020  # RW

FREQ_1     = 0x1000_0000  # RW
FREQ_2     = 0x1000_0004  # RW

DATA_1     = 0x2000_0000  # R
DATA_2     = 0x2000_0004  # R

read_byte = 0x01
write_byte = 0x00
dummy_byte = 0x00


def write(device, addr, data):
    print(f'Write addr - {addr:04x}, data - {data:04x}')
    device.spiMaster_SingleWrite(write_byte, False)
    byte = addr.to_bytes(4, byteorder="big")
    device.spiMaster_SingleWrite(byte[0:1], False)
    device.spiMaster_SingleWrite(byte[1:2], False)
    device.spiMaster_SingleWrite(byte[2:3], False)
    device.spiMaster_SingleWrite(byte[3:4], False)
    byte = data.to_bytes(4, byteorder="big")
    device.spiMaster_SingleWrite(byte[0:1], False)
    device.spiMaster_SingleWrite(byte[1:2], False)
    device.spiMaster_SingleWrite(byte[2:3], False)
    device.spiMaster_SingleWrite(byte[3:4], False)
    device.spiMaster_SingleWrite(dummy_byte, False)
    print(f'Status - {device.spiMaster_SingleRead(0x01, True).hex()}\n')


def read(device, addr):
    print(f'Read addr - {addr:04x}')
    device.spiMaster_SingleWrite(read_byte, False)
    byte = addr.to_bytes(4, byteorder="big")
    device.spiMaster_SingleWrite(byte[0:1], False)
    device.spiMaster_SingleWrite(byte[1:2], False)
    device.spiMaster_SingleWrite(byte[2:3], False)
    device.spiMaster_SingleWrite(byte[3:4], False)
    device.spiMaster_SingleWrite(dummy_byte, False)
    data = bytearray()
    data.append(device.spiMaster_SingleRead(0x01, False)[0])
    data.append(device.spiMaster_SingleRead(0x01, False)[0])
    data.append(device.spiMaster_SingleRead(0x01, False)[0])
    data.append(device.spiMaster_SingleRead(0x01, False)[0])
    print(f'Status - {device.spiMaster_SingleRead(0x01, True).hex()}\n')
    return data.hex()


def test():
    # open 'device' with default description 'FT4222 A'
    device = ft4222.openByDescription('FT4222 A')

    # init spi master
    device.spiMaster_Init(Mode.SINGLE, Clock.DIV_128, Cpol.IDLE_LOW, Cpha.CLK_LEADING, SlaveSelect.SS0)

    write(device, NUM_SAMP , 5000 )
    write(device, SAMP_FREQ, 10000)

    write(device, FREQ_1, 2000)
    write(device, FREQ_2, 4000)

    write(device, EN_CORDIC, 1)

    sleep(1)

    data1 = read(device, DATA_1)
    data2 = read(device, DATA_2)

    print('Result of test:')
    print(f'Freq 1 : {data1}')
    print(f'Freq 2 : {data2}')


if __name__ == '__main__':
    test()
