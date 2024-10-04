#!/bin/bash

pidof hypridle || hypridle;
pidof hyprlock || hyprlock -q
kill %%;
