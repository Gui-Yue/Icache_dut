try:
    from UT_ICache import *
except:
    try:
        from ICache import *
    except:
        from __init__ import *


if __name__ == "__main__":
    dut = DUTICache()
    # dut.InitClock("clk")

    dut.Step(1)

    dut.Finish()
