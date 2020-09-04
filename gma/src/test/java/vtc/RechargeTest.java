package vtc;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import vtc.ui.membership.RechargeMoney;

public class RechargeTest {
    @Test
    public void RechargeTC1() {
        try {
            Boolean result = RechargeMoney.isValidMoney("");
            Boolean expected = false;
            assertTrue(result.equals(expected));
        } catch (Exception e) {

        }
    }

    @Test
    public void RechargeTC2() {
        try {
            Boolean result = RechargeMoney.isValidMoney(null);
            Boolean expected = false;
            assertTrue(result.equals(expected));
        } catch (Exception e) {
        }
    }

    @Test
    public void RechargeTC3() {
        try {

            Boolean result = RechargeMoney.isValidMoney("This is a string!");
            Boolean expected = false;
            assertTrue(result.equals(expected));
        } catch (Exception e) {
        }
    }

    @Test
    public void RechargeTC4() {
        try {

            Boolean result = RechargeMoney.isRangeMoneyValid("11000000");
            Boolean expected = false;
            assertTrue(result.equals(expected));
        } catch (Exception e) {
        }
    }

    @Test
    public void RechargeTC5() {
        try {

            Boolean result = RechargeMoney.isRangeMoneyValid("9999");
            Boolean expected = false;
            assertTrue(result.equals(expected));
        } catch (Exception e) {
        }
    }

    @Test
    public void RechargeTC6() {
        try {
            Boolean result = RechargeMoney.isRangeMoneyValid("12345");
            Boolean expected = true;
            assertTrue(result.equals(expected));
        } catch (Exception e) {
        }
    }
}