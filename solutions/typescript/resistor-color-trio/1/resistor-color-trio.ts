const colorMap = {
  black: 0,
  brown: 1,
  red: 2,
  orange: 3,
  yellow: 4,
  green: 5,
  blue: 6,
  violet: 7,
  grey: 8,
  white: 9,
};

type Color = keyof typeof colorMap;

export function decodedResistorValue([color1, color2, color3]: Color[]) {
  const value =
    Number(`${colorMap[color1]}${colorMap[color2]}`) * 10 ** colorMap[color3];

  return value > 1000 ? `${value / 1000} kiloohms` : `${value} ohms`;
}
