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

export function decodedValue([band1, band2]: Color[]): number {
  return Number(`${colorMap[band1]}${colorMap[band2]}`);
}
