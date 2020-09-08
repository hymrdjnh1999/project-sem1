// package vtc;

// import static org.junit.Assert.assertTrue;

// import org.junit.Test;

// import vtc.ui.membership.Membership;

// /**
//  * LoginTest
//  */
// public class LoginTest {
//     @Test
//     public void LoginTC1() {
//         String expected = "username or password is empty";

//         try {
//             new Membership().authentication("", "");
//         } catch (Exception e) {
//             assertTrue("not empty", e.getMessage().toString().equalsIgnoreCase(expected));
//         }

//     }

//     @Test
//     public void LoginTC2() {
//         try {

//             final Boolean result = new Membership().authentication(null, "123456789a");
//             final Boolean expected = false;
//             assertTrue(result.equals(expected));
//         } catch (Exception e) {

//         }

//     }

//     @Test
//     public void LoginTC3() {
//         try {
//             final Boolean result = new Membership().authentication("voibenho1", "123456789a");
//             boolean expected = false;
//             assertTrue(result == expected);
//         } catch (Exception e) {
//         }

//     }

//     @Test
//     public void LoginTC4() {
//         try {
//             final Boolean result = new Membership().authentication("thanh96", "123456789");
//             final Boolean expected = false;
//             assertTrue(result.equals(expected));
//         } catch (Exception e) {

//         }

//     }

//     @Test
//     public void LoginTC5() throws Exception {

//         final Boolean result = new Membership().authentication("thanh96", "123456789a");
//         final Boolean expected = true;
//         assertTrue(result.equals(expected));

//     }
// }