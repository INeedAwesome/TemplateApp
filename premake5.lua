workspace "TemplateApp"
   architecture "x64"
   configurations { "Debug", "Release", "Dist" }
   startproject "TemplateApp"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "TemplateApp"