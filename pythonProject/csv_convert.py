
import csv


def test():

    with open("D:\\Desktop\\Study_now\\SRW\\GoertzelAlgorithm\\src\\sim\\data\\sample.csv") as f:
        reader = csv.reader(f, delimiter=" ")
        data_read = [row for row in reader]
        # print(data_read)

    i = 0
    for element in data_read:
        data_read[i][0] = format(int(data_read[i][0]), '08b')
        i = i + 1

    with open("D:\\Desktop\\Study_now\\SRW\\GoertzelAlgorithm\\src\\sim\\data\\sample_bin.csv", "w", newline='') as f:
        writer = csv.writer(f, delimiter="\n")
        writer.writerows(data_read)


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    test()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
