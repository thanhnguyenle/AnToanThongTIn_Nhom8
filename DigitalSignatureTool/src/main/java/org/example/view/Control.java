package org.example.view;

import javax.swing.*;

public class Control {
    public void clearScreen(JPanel panelToClear) {
        panelToClear.removeAll();
    }

    public void addScreen(JPanel panelToAdd, JPanel mainPanel) {
        mainPanel.add(panelToAdd);

    }

}
