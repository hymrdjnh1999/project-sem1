// package vtc;

// import static org.junit.Assert.assertTrue;

// import org.junit.Test;

// import vtc.bl.GameBL;
// import vtc.ui.game.GameHelper;

// public class ViewGameListTest {
// @Test
// public void ViewGameListTC1() {
// GameHelper GameHelper = new GameHelper(0, new GameBL().getGameList(0), "");
// try {
// GameHelper.checkInputIsGameIndex("invalid input");
// } catch (Exception e) {
// assertTrue("true input", e.getMessage().toString().equalsIgnoreCase("input is
// not one in options!"));
// }
// }

// @Test
// public void ViewGameListTC2() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.firstPage("");

// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("empty input"));
// }
// }

// @Test
// public void ViewGameListTC3() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.midPage("");

// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("empty input"));
// }
// }

// @Test
// public void ViewGameListTC4() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.lastPage("");

// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("empty input"));
// }
// }

// @Test
// public void ViewGameListTC5() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.firstPage("n");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is next!"));
// }
// }

// @Test
// public void ViewGameListTC6() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.midPage("n");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is next!"));
// }
// }

// @Test
// public void ViewGameListTC7() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.firstPage("q");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is back!"));
// }
// }

// @Test
// public void ViewGameListTC8() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.midPage("q");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is back!"));
// }
// }

// @Test
// public void ViewGameListTC9() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.lastPage("q");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is back!"));
// }
// }

// @Test
// public void ViewGameListTC10() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.midPage("p");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is back to
// previousPage!"));
// }
// }

// @Test
// public void ViewGameListTC11() {
// GameHelper GameHelper = new GameHelper();
// try {
// GameHelper.lastPage("p");
// } catch (Exception e) {
// assertTrue(e.getMessage().toString().equalsIgnoreCase("input is back to
// previousPage!"));
// }
// }

// @Test
// public void ViewGameListTC12() {
// GameHelper GameHelper = new GameHelper(0, new GameBL().getGameList(0), "");
// try {
// GameHelper.checkInputIsGameIndex("7");
// } catch (Exception e) {
// assertTrue("true input", e.getMessage().toString().equalsIgnoreCase("Game
// index not found!"));
// }
// }

// @Test
// public void ViewGameListTC13() {
// GameHelper GameHelper = new GameHelper(0, new GameBL().getGameList(0), "");
// try {
// GameHelper.checkInputIsGameIndex("0");
// } catch (Exception e) {
// assertTrue("true input", e.getMessage().toString().equalsIgnoreCase("Game
// index not found!"));
// }
// }

// @Test
// public void ViewGameListTC14() {
// GameHelper GameHelper = new GameHelper(10, new GameBL().getGameList(10), "");
// try {
// GameHelper.checkInputIsGameIndex("15");
// } catch (Exception e) {
// assertTrue("is not game index",
// e.getMessage().toString().equalsIgnoreCase("input is game index"));
// }
// }
// }