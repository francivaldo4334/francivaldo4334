/*
Copyright 2020 Alabahuy

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
#include QMK_KEYBOARD_H


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    [0] = LAYOUT_ortho_4x4(
        KC_NUM,  KC_PSLS, KC_PAST, MO(1),
        KC_P7,   KC_P8,   KC_P9,   KC_PEQL,
        KC_P4,   KC_P5,   KC_P6,   KC_PPLS,
        KC_P1,   KC_P2,   KC_P3,   KC_PENT
    ),

    [1] = LAYOUT_ortho_4x4(
        KC_TRNS, UG_HUEU, UG_HUED,  KC_TRNS,
        UG_SATU, UG_SATD, KC_MNXT,  KC_MPRV,
        UG_VALU, UG_VALD, KC_MSTP,  KC_MPLY,
        KC_COPY, KC_PSTE, KC_MYCM,  UG_TOGG
    )
};

bool encoder_update_user(uint8_t index, bool clockwise) {
    if (index == 0) { /* First encoder */
        if (clockwise) {
            tap_code(KC_VOLD);
        } else {
            tap_code(KC_VOLU);
        }
    } else if (index == 1) { /* Second encoder */
        if (clockwise) {
            tap_code(KC_WH_D);
        } else {
            tap_code(KC_WH_U);
        }
    }
    return true;
}