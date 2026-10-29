#Requires AutoHotkey v2.0
#SingleInstance Force
CoordMode "Mouse", "Screen"

; —————————————————————————————————————————
; Скрипт AHK v2: разворачивает Photoshop при drag&drop на его иконку
; —————————————————————————————————————————

; Флаг, указывающий, что кнопка мыши зажата
global dragging := false

; Обработчик нажатия ЛКМ — включаем флаг
~LButton::
{
    global dragging
    dragging := true
}

; Обработчик отпускания ЛКМ — сбрасываем флаг
~LButton Up::
{
    global dragging
    dragging := false
}

; Запускаем таймер, срабатывающий каждые 100 мс
SetTimer TrayDragCheck, 100
return

; Функция проверки: если тащим файл и курсор над панелью задач — активируем Photoshop
TrayDragCheck()
{
    if !dragging
        return

    ; Получаем текущие координаты курсора
    MouseGetPos &mx, &my

    ; Позиция и размеры панели задач
    WinGetPos(&tx, &ty, &tw, &th, "ahk_class Shell_TrayWnd")

    ; Если курсор над панелью задач
    if (mx >= tx && mx <= tx + tw && my >= ty && my <= ty + th)
    {
        ; Находим окно Photoshop по имени exe
        hwnd := WinExist("ahk_exe Photoshop.exe")
        if hwnd
        {
            ; Если свернуто — восстанавливаем
            WinRestore(hwnd)
            ; Активируем окно
            WinActivate(hwnd)
        }
    }
}
