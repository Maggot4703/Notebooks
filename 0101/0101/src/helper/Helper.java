/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import java.awt.Button;
import java.awt.Label;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author mark
 */
public class Helper {

  private static final String help = "#cd /home/mark/Traveller/Netbeans/Helper/src/helper\n";
  private static final String FS = "/";
  private static final String CRLF = "\n";
  private static String spacer;

  /**
   * @param args the command line arguments
   */
  public static void main(String[] args) {
    spacer = "//\n//\n";
    for (int i = 0; i < 40; i++) {
      spacer += "//";
    }
    spacer += "\n//\n//";
    createFrame();
  }

  private static void createFrame() {
    String title = "Helper";
    JFrame jframe = new JFrame();
    JPanel jpanel = new JPanel();
    TextArea textarea1 = new TextArea(5, 20);
    textarea1.setText(help);
    Label label = new Label("Convert String");
    TextField textfield1 = new TextField(20);
    String string0 = "" + spacer + CRLF;
    String string1 = "%s --help >./helper-%s.txt";
    String string2 = "man %s >./helpMan-%s.txt";
    textfield1.setText(string1);
    TextArea textarea2 = new TextArea(5, 20);

    Button openbutton = new Button("Input");
    ActionListener open = (ActionEvent ae) -> {
        String fname = "./src/helper/Input.txt";
        textarea1.setText(help);
        String[] txts = getLinesFromFile(new File(fname));
        for (String txt : txts) {
            if (!txt.startsWith("#")) {
                textarea1.append(txt.trim() + "\n");
            }
        }
    };
    openbutton.addActionListener(open);

    Button savebutton = new Button("Output");
    ActionListener save = (ActionEvent ae) -> {
        //        String spacer = "//\n//\n";
//        for (int i = 0; i < 40; i++) {
//          spacer += "//";
//        }
//        spacer += "\n//\n//";
String[] lines = textarea1.getText().split(CRLF);
for (int i = 0; i < lines.length; i++) {
    if (!lines[i].startsWith("#")) {
//            textarea2.append(string0.replace("%s".trim(), lines[i].trim()).trim() + CRLF);
textarea2.append(string1.replace("%s".trim(), lines[i].trim()).trim() + CRLF);
textarea2.append(string2.replace("%s".trim(), lines[i].trim()).trim() + CRLF);
//                        textarea2.append(string3.replace("%s", lines[i]) + CRLF);

    }
}
String let = lines[1].toString().substring(0, 1).toUpperCase();
String ss = "./src/helper/Output/" + "Output_" + let;
File f = new File(ss);
if (!f.exists()) {
    f.mkdir();
}
saveTextFile(ss, "Output", ".sh", textarea2.getText());
    };
    savebutton.addActionListener(save);

    TextField textfield2 = new TextField(10);
    textfield2.setText("man");
    JButton findButton = new JButton("Find");
    TextArea textarea3 = new TextArea(5, 20);
    ActionListener finder = (ActionEvent ae) -> {
        String spacer1 = "//\n//\n";
        for (int i = 0; i < 40; i++) {
            spacer1 += "//";
        }
        spacer1 += "\n//\n//";
        //
        String string = textfield2.getText();
        String script = "";
        script += "#! /bin/bash" + CRLF;
        script += "" + help.replace("#", "") + CRLF;
        script += "echo '" + spacer1 + "' >./HelpMan/%s.txt" + CRLF;
        script += "which %s >>./HelpMan/%s.txt" + CRLF;
        script += "whatis %s >>./HelpMan/%s.txt" + CRLF;
        script += "%s --help >>./HelpMan/%s.txt" + CRLF;
        script += "man %s >>./HelpMan/%s.txt" + CRLF;
        textarea3.setText(script.replace("%s", string.trim()));
        String dir = "./src/helper/HelpMan/";
        File f = new File(dir);
        if (!f.exists()) {
            f.mkdir();
        }
        saveTextFile(dir, string, ".sh", textarea3.getText());
        System.out.println("" + dir);
    };
    findButton.addActionListener(finder);

    Button scripting = new Button("Script");
    TextArea textarea4 = new TextArea(5, 20);
    ActionListener scripter;
    scripter = (ActionEvent ae) -> {
        // bash each script within HelpMan folder and save output as EXECUTE_SCRIPT.sh
        String dir = "./src/helper/HelpMan/";
        String name = "EXECUTE_SCRIPT";
        File file = new File(dir);
        if (!file.exists()) {
            file.mkdir();
        }
        String script = "";
//        String tmp = "";
script += "#! /bin/bash" + CRLF;
script += "cd " + dir.replace("#", "") + CRLF;
String[] list = file.list();
Arrays.sort(list);
for (int i = 0; i < list.length; i++) {
    if (list[i].endsWith(".sh") && !list[i].startsWith("EXECUTE_SCRIPT") && (!"".equals(list[i]))) {
        script += "/bin/bash ./" + list[i].trim() + "" + CRLF;
//            tmp += list[i] + CRLF;
    }
}

textarea4.setText(script.replace("%s", name));
File f = new File(dir);
if (!f.exists()) {
    f.mkdir();
}
saveTextFile(dir, name, ".SH", textarea4.getText());
System.out.println("");
    };
    scripting.addActionListener(scripter);

    String[] lets = {
      "A", "B", "C", "D", "E", "F",
      "G", "H", "I", "J", "K", "L", "M",
      "N", "O", "P", "Q", "R", "S",
      "T", "U", "V", "W", "X", "Y", "Z"};

    Button all = new Button("ALL");
//    TextArea textarea4 = new TextArea(5, 20);
    ActionListener aller;
    aller = (ActionEvent ae) -> {
        String out = "";
        String fname;
        String[] lines;
        for (int i = 0; i < 26; i++) {
            fname = "/home/mark/Traveller/Netbeans/Helper/src/helper/Output/Output_" + lets[i] + "/Add" + lets[i] + ".txt";
            File file = new File(fname);
            lines = getLinesFromFile(file);
            System.out.println(fname + ".exists = " + file.exists());
//          String[] ignores = getLinesFromFile(new File(fname.replace("/Add", "/_Ignore")));
for (int j = 0; j < lines.length; j++) {
    if (!lines[j].startsWith("#")) {
        //<editor-fold defaultstate="collapsed" desc="old">
        //               for (int k = 0; k < ignores.length; k++) {
        //                if(lines[j].contains(ignores[k])) {
        //                  System.out.println("ignores[k]" + " = " + k);
        //                  System.out.println("" + lines[j]);
        //                  System.out.println(fname.replace("/Add", "/_Ignore") + ".exists = " + file.exists());
        //                  break;
        //                }
        //               }
        //</editor-fold>
        out += lines[j] + CRLF;
    }
}
        }
        textarea1.setText(help + out);
        lines = out.split(CRLF);
        for (int i = 0; i < lines.length; i++) {
            textfield2.setText(lines[i]);
            findButton.doClick();
        }
        JOptionPane.showMessageDialog(null, "Phew!");
    };
    all.addActionListener(aller);

    Button html = new Button("HTML");
    ActionListener webber;
    webber = (ActionEvent e) -> {
        String string = "";
        for (int i = 1; i < textarea1.getText().split(CRLF).length; i++) {
            String NAME = textarea1.getText().split(CRLF)[i];
            string = "<div><a href='../HelpMan/" + NAME + ".txt' >" + NAME + "</a></div>";
            System.out.println("" + string);
        }
    };
    html.addActionListener(webber);

    jpanel.add(textarea1);
    jpanel.add(label);
    jpanel.add(textfield1);
    jpanel.add(textarea2);
    jpanel.add(openbutton);
    jpanel.add(savebutton);
    jpanel.add(findButton);
    jpanel.add(textfield2);
    jpanel.add(scripting);
    jpanel.add(textarea3);
    jpanel.add(textarea4);
    jpanel.add(all);
    jpanel.add(html);

    jframe.pack();
    jframe.setTitle(title);
    jframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    jframe.setSize(200, 700);
    jframe.getContentPane().add(jpanel);
    jframe.setVisible(true);
  }

  public static void saveTextFile(String dir, String file, String ext,
          String txt) {
    //<editor-fold defaultstate="collapsed" desc="DEBUG">
    boolean DEBUG = false;
    if (DEBUG) { // true or false
      System.out.print(comment("=", 20));
      System.out.println("\t" + Thread.currentThread().getStackTrace()[1].getMethodName());
      System.out.print(comment("-", 20));
    }
//</editor-fold>
    String string;
    string = null;
    //JOptionPane.showMessageDialog(null, string);
    try {
      string = dir + FS + file + "." + ext.toLowerCase();
      string = string.replace(FS + FS, FS);
      string = string.replace("..", ".");
//            JOptionPane.showMessageDialog(null, string);
      System.out.println("" + " = " + string);
      try (PrintWriter out = new PrintWriter(new FileWriter(new File(string)))) {
        out.print(txt);
        out.close();
      }
    } catch (IOException ex) {
      System.out.println("IOException" + " = " + ex);
    }
  }

  public static String comment(String comm, int num) {
    String string = "";
    for (int i = 0; i < num; i++) {
      string += (comm);
    }
    return string + CRLF;
  }

  public static String[] getLinesFromFile(File f) {
    String line;
    String[] lines = new String[countLines(f)];
    int max = 0;
    int i = 0;
    try {
      BufferedReader in = new BufferedReader(new FileReader(f));
      try {
        while ((line = in.readLine()) != null) {
          //line = line.trim();
          lines[i] = line;
          i += 1;
        }
        in.close();

      } catch (IOException ex) {
        //Logger.getLogger(GlobalMethods.class.getName()).log(Level.SEVERE, null, ex);
      }
    } catch (FileNotFoundException ex) {
      //Logger.getLogger(GlobalMethods.class.getName()).log(Level.SEVERE, null, ex);
    }
    return lines;
  }

  public static int countLines(File file) {
    int lines = 0;
    try {
      BufferedReader reader = new BufferedReader(new FileReader(file));
      String line;
      // read input lines until the end of file is reached
      while ((line = reader.readLine()) != null) {
        lines++; // increment line count
      }
      reader.close();
    } catch (IOException exception) {
    }
    return lines;
  }

}
