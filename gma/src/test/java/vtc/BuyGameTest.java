// package vtc;

// import static org.junit.Assert.assertTrue;

// import org.junit.Test;

// import vtc.bl.AccountBL;
// import vtc.persistances.Account;
// import vtc.persistances.Game;
// import vtc.ui.game.BuyGame;
// import vtc.ui.membership.Membership;

// public class BuyGameTest {
//     @Test
//     public void BuyGameTC1() {
//         Account account = new Membership().getAccount();
//         boolean result = account.getStatus().equals("active");
//         boolean expected = false;
//         assertTrue("account was login", result == expected);
//     }

//     @Test
//     public void BuyGameTC2() {
//         Account account = new AccountBL().getAccount("voibenho");
//         boolean result = account.getStatus().equals("active");
//         boolean expected = true;
//         assertTrue(result == expected);
//     }

//     @Test
//     public void BuyGameTC3() {
//         Game game = new Game();
//         game.setGamePrice(50005500d);
//         Account account = new AccountBL().getAccount("thanh96");
//         boolean result = BuyGame.checkBalance(game, account);
//         boolean expected = false;
//         assertTrue("enough", result == expected);
//     }

//     @Test
//     public void BuyGameTC4() {
//         Game game = new Game();
//         game.setGamePrice(10000d);
//         Account account = new AccountBL().getAccount("thanh96");
//         boolean result = BuyGame.checkBalance(game, account);
//         boolean expected = true;
//         assertTrue("not enough", result == expected);
//     }
// }